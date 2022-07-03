import 'package:finance_mobile_app/Constants/firebase_auth_constants.dart';
import 'package:finance_mobile_app/helper/firestore_db.dart';

import 'package:finance_mobile_app/widgets/MyHomePage.dart';

import 'package:finance_mobile_app/widgets/my_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late Rx<User?> firebaseUser;
  static AuthController instance = Get.find<AuthController>();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setIntializeScreen);
  }

  _setIntializeScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const MyHomePage());
    } else {
      Get.offAll(() => const MyMainMenu());
    }
  }

  void singup(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      await FireStoreDB.addUser(email, 0.0);
    } catch (e) {
      print(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
    } catch (e) {
      print(e.toString());
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
