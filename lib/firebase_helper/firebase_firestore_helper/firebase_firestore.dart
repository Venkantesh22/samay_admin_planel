import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:samay_admin_plan/models/admin_models.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Get Admin information
  Future<AdminModel?> getAdminInformation() async {
    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        throw Exception("User not authenticated");
      }

      DocumentSnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("admins").doc(uid).get();

      if (!querySnapshot.exists) {
        throw Exception("Admin document does not exist");
      }

      return AdminModel.fromJson(querySnapshot.data()!);
    } catch (e) {
      print("Error getting admin information: $e");
      return null; // or handle error as appropriate for your app flow
    }
  }
}
// class FirebaseFirestoreHelper {
//   static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//   // Get Admin information
//   Future<AdminModel?> getAdminInformation() async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> querySnapshot =
//           await _firebaseFirestore
//               .collection("admins")
//               .doc(FirebaseAuth.instance.currentUser!.uid)
//               .get();

//       if (!querySnapshot.exists) {
//         throw Exception("Admin document does not exist");
//       }

//       return AdminModel.fromJson(querySnapshot.data()!);
//     } catch (e) {
//       print("Error getting admin information: $e");
//       return null;
//     }
//   }
// }


// class FirebaseFirestoreHelper {
//   static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//   Future<AdminModel> getAdminInformation() async {
//     try {
//       String uid = FirebaseAuth.instance.currentUser!.uid;
//       DocumentSnapshot<Map<String, dynamic>> querySnapshot =
//           await _firebaseFirestore.collection("admins").doc(uid).get();
//       if (querySnapshot.exists) {
//         return AdminModel.fromJson(querySnapshot.data()!);
//       } else {
//         throw Exception("Admin document does not exist");
//       }
//     } catch (e) {
//       print('Error getting admin information: $e');
//       rethrow;
//     }
//   }

  
// }
