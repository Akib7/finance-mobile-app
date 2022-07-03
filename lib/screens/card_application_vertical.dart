import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardApplicationVertical extends StatelessWidget {
  final String title;
  const CardApplicationVertical({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 120,
              width: 145,
              decoration: BoxDecoration(
                color: signup_color,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 12,
          ),
          child: Icon(
            CupertinoIcons.creditcard,
            size: 45,
            color: login_color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 60,
          ),
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 145,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0.2,
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                child: Column(
                  children: [
                    const Text(
                      "18",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      title + " channel",
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(-0, 5),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              // border:
                              //     Border.all(width: 1, color: Colors.red),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-15, 5),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              // border:
                              //     Border.all(width: 1, color: Colors.red),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-30, 5),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              //   border:
                              //       Border.all(width: 1, color: Colors.red),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-15, 5),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              //   border:
                              //       Border.all(width: 1, color: Colors.red),
                            ),
                            child: const Center(
                              child: Text(
                                "+14",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
