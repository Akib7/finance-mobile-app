import 'package:finance_mobile_app/Controllers/auth_controller.dart';
import 'package:finance_mobile_app/widgets/MyHomePage.dart';
import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Constants/firebase_auth_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // fontFamily: 'OpenSans',
        // primarySwatch: Colors.blue,
        primaryColor: Colors.blue.shade300,
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.grey,
          filled: true,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: defaultPadding * 1.2,
            horizontal: defaultPadding,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
