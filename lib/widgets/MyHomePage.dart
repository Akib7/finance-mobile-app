// ignore_for_file: file_names

import 'dart:math';
import 'package:finance_mobile_app/widgets/SocialButtons.dart';
import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:flutter/material.dart';

import 'LoginForm.dart';
import 'SignUp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool isShowSignUp = false;

  late AnimationController animationController;
  late Animation<double> animationTextRotate;

  void setUpAnimation() {
    animationController =
        AnimationController(vsync: this, duration: defaultDuration);

    animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(animationController);
  }

  void updateView() {
    setState(() {
      isShowSignUp = !isShowSignUp;
    });

    isShowSignUp
        ? animationController.forward()
        : animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Stack(
              children: [
                // login
                AnimatedPositioned(
                  duration: defaultDuration,
                  width: size.width * 0.88,
                  height: size.height,
                  left: isShowSignUp ? -size.width * 0.76 : 0,
                  child: Container(
                    color: login_color,
                    child: const LoginForm(),
                  ),
                ),

                // signup
                AnimatedPositioned(
                  duration: defaultDuration,
                  width: size.width * 0.88,
                  height: size.height,
                  left: isShowSignUp
                      ? size.width * 0.12
                      : size.width * 0.88, //space 88% from left
                  child: Container(
                    color: signup_color,
                    child: const SignUp(),
                  ),
                ),
                AnimatedPositioned(
                  duration: defaultDuration,
                  width: size.width,
                  bottom: size.height * 0.1,
                  right: isShowSignUp ? -size.width * 0.06 : size.width * 0.06,
                  child: const SocialButtons(),
                ),

                // loginText
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom:
                      isShowSignUp ? size.height / 2 - 80 : size.height * 0.3,
                  left: isShowSignUp ? 0 : size.width * 0.44 - 80,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isShowSignUp ? signup_color : Colors.white70,
                      fontSize: isShowSignUp ? 20 : 32,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Transform.rotate(
                      alignment: Alignment.topLeft,
                      angle: -animationTextRotate.value * pi / 180,
                      child: InkWell(
                        onTap: () {
                          if (isShowSignUp) {
                            updateView();
                          } else {
                            //login
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding * 0.75),
                          width: 160,
                          child: Text(
                            "Log in".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // signup text

                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom:
                      !isShowSignUp ? size.height / 2 - 80 : size.height * 0.15,
                  right: isShowSignUp ? size.width * 0.44 - 80 : 0,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: !isShowSignUp ? login_color : login_color,
                      fontSize: !isShowSignUp ? 20 : 32,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Transform.rotate(
                      alignment: Alignment.topRight,
                      angle: (90 - animationTextRotate.value) * pi / 180,
                      child: InkWell(
                        onTap: () {
                          if (isShowSignUp) {
                            //signup
                          } else {
                            updateView();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding * 0.75),
                          width: 160,
                          child: Text(
                            "Sign Up".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
