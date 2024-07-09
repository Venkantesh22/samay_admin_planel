import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:samay_admin_plan/models/admin_models.dart';
import 'package:samay_admin_plan/models/salon_infor_model.dart';

class FirebaseStorageHelper {
  static FirebaseStorageHelper instance = FirebaseStorageHelper();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadImageToStorage(
      AdminModel adminData, Uint8List selectedImage) async {
    try {
      Reference imageRef = _storage.ref("Profileimages/${adminData.id}.jpg");
      UploadTask task = imageRef.putData(
          selectedImage, SettableMetadata(contentType: 'image/jpeg'));
      TaskSnapshot snapshot = await task;
      String imageUrl = await snapshot.ref.getDownloadURL();
      adminData.image = imageUrl;
      return imageUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<String?> uploadImageToStorageSalon(
      SalonModel salonModel, Uint8List selectedImage) async {
    try {
      Reference imageRef = _storage.ref("Salon images/${salonModel.id}.jpg");
      UploadTask task = imageRef.putData(
          selectedImage, SettableMetadata(contentType: 'image/jpeg'));
      TaskSnapshot snapshot = await task;
      String imageUrl = await snapshot.ref.getDownloadURL();
      salonModel.image = imageUrl;
      return imageUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }
}
