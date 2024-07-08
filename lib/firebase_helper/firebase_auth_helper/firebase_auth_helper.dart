// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:samay_admin_plan/constants/constants.dart';
import 'package:samay_admin_plan/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:samay_admin_plan/models/admin_models.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context, rootNavigator: true).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(error.code.toString());
      return false;
    }
  }

  Future<bool> signUp(String name, String number, String email, String password,
      Uint8List selectedImage, BuildContext context) async {
    try {
      showLoaderDialog(context);

      // Create admin account
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Upload image to storage
      String uidOfCreateUser = userCredential.user!.uid;
      final adminData =
          AdminModel(uidOfCreateUser, name, email, int.parse(number), password);

      String? uploadImageUrl = await FirebaseStorageHelper.instance
          .uploadImageToStorage(adminData, selectedImage);

      await _auth.currentUser?.updateDisplayName(adminData.name);
      await _auth.currentUser?.updatePhotoURL(uploadImageUrl);

      // Save admin data to Firestore
      adminData.image = uploadImageUrl; // Make sure image URL is included
      await _firestore
          .collection("admins")
          .doc(adminData.id)
          .set(adminData.toJson());

      Navigator.of(context, rootNavigator: true).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(error.code.toString());
      return false;
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(e.toString());
      return false;
    }
  }

  // Future<bool> signUp(String name, String number, String email, String password,
  //     Uint8List selectedImage, BuildContext context) async {
  //   try {
  //     showLoaderDialog(context);

  //     //1. create admin account
  //     UserCredential? userCredential = await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password);

  //     //2. upload image to storage
  //     String? uidOfCreateUser = userCredential.user!.uid;
  //     final adminData =
  //         AdminModel(uidOfCreateUser, name, email, int.parse(number), password);

  //     String? uploadImageUrl = await FirebaseStorageHelper.instance
  //         .uploadImageToStorage(adminData, selectedImage);

  //     await _auth.currentUser?.updateDisplayName(adminData.name);
  //     await _auth.currentUser?.updatePhotoURL(uploadImageUrl);

  //     _firestore.collection("admins").doc(adminData.id).set(
  //           adminData.toJson(),
  //         );

  //     Navigator.of(context, rootNavigator: true).pop();
  //     return true;
  //   } on FirebaseAuthException catch (error) {
  //     Navigator.of(context, rootNavigator: true).pop();
  //     showMessage(error.code.toString());
  //     return false;
  //   }
  // }

  void signOut() async {
    await _auth.signOut();
  }
}
