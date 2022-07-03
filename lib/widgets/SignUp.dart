// ignore_for_file: file_names

import 'package:finance_mobile_app/Constants/firebase_auth_constants.dart';
import 'package:finance_mobile_app/widgets/MyHomePage.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

import 'package:finance_mobile_app/widgets/constants.dart';

class SignUp extends StatefulWidget {
  static String userName = '';
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = "", email = "", phone = "";
  TextEditingController emailText = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        key: formkey,
        child: Scaffold(
          backgroundColor: signup_color,
          body: Column(
            children: [
              const Spacer(
                  // flex: 2,
                  ),
              Material(
                color: signup_color,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter User name';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    if (value == null || value.isEmpty) {
                      name = value.toString();
                      SignUp.userName += value.toString();
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "User Name",
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Material(
                  color: signup_color,
                  child: TextFormField(
                    controller: emailText,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      if (!RegExp(
                              r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$")
                          .hasMatch(value)) {
                        return 'Please enter a valid Email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      if (value == null || value.isEmpty) {
                        email = value.toString();
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                ),
              ),
              Material(
                color: signup_color,
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }
                    if (value.length <= 6) {
                      return "Password should not be less that 6 characters";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Material(
                  color: signup_color,
                  child: TextFormField(
                    obscureText: true,
                    controller: confirmPassword,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Password again";
                      }
                      if (value.length <= 6) {
                        return "Password should not be less that 6 characters";
                      }
                      if (password.text != confirmPassword.text) {
                        return "Password does not match";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: login_color,
                ),
                onPressed: () {
                  if (formkey.currentState != null &&
                      formkey.currentState!.validate()) {
                    print("Login Successful");
                    authController.singup(
                        emailText.text.trim(), password.text.trim());
                  } else {
                    print("Login Unsuccessful");
                  }
                  // Get.to(() => const MyHomePage());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MyHomePage(),
                  //   ),
                  // );
                },
                child: const Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(),
                    ),
                  );
                },
                child: const Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: const Text(
              //     "Forgot Password?",
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
