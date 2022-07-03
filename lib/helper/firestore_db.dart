import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_mobile_app/Constants/firebase_auth_constants.dart';
import 'package:finance_mobile_app/widgets/SignUp.dart';

class FireStoreDB {
  static addUser(String email, double balance) async {
    await firebaseFirestore.collection('users').doc(auth.currentUser!.uid).set({
      'email': email,
      'balance': balance,
      'createdOn': Timestamp.now(),
    });
  }

  // static addImage(File image) async {
  //   await firebaseFirestore.collection('users').add({
  //     'image': image,
  //   });
  // }
}
