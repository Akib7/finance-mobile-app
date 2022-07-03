import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CardApplication extends StatelessWidget {
  final String title;
  const CardApplication({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 130,
              width: width / 2.8,
              decoration: BoxDecoration(
                color: login_color,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 84, vertical: 70),
              child: Icon(
                CupertinoIcons.money_dollar_circle,
                size: 40,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Container(
          height: 130,
          width: 130,
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
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 35),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text(
                        "Pending",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 37),
                        child: Text(
                          "Details",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        "\$" + "2500.30",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 135,
                  vertical: 45,
                ),
                child: Icon(
                  CupertinoIcons.money_dollar_circle,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
