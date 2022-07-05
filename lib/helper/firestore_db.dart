import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_mobile_app/Constants/firebase_auth_constants.dart';

class FireStoreDB {
  static addUser(String email, String userName) async {
    await firebaseFirestore.collection('users').doc(auth.currentUser!.uid).set({
      'email': email,
      'userName': userName,
      'createdOn': Timestamp.now(),
    });
  }
}
