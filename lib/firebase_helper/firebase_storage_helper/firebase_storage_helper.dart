import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:samay_admin_plan/constants/constants.dart';

class FirebaseStorageHelper {
  static FirebaseStorageHelper instance = FirebaseStorageHelper();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  

  Future<String?> uploadProfileImageToStorage(
      String imageName, String folderName, Uint8List selectedImage) async {
    try {
      Reference imageRef = _storage.ref("$folderName/$imageName.jpg");
      UploadTask task = imageRef.putData(
          selectedImage, SettableMetadata(contentType: 'image/jpeg'));
      TaskSnapshot snapshot = await task;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      showMessage("Error uploading image: ${e.toString()}");
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<String?> uploadSalonImageToStorage(
      String imageName, String folderName, Uint8List selectedImage) async {
    try {
      Reference imageRef =
          _storage.ref("Salon_Images/$folderName/$imageName.jpg");
      UploadTask task = imageRef.putData(
          selectedImage, SettableMetadata(contentType: 'image/jpeg'));
      TaskSnapshot snapshot = await task;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      showMessage("Error uploading image: ${e.toString()}");
      print("Error uploading image: $e");
      return null;
    }
  }

  
}
