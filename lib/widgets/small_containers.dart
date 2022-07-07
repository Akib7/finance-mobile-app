import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class SmallContainers extends StatelessWidget {
  final Function()? ontap;
  final String text;
  const SmallContainers({Key? key, required this.ontap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding * 29.5, horizontal: 22),
        child: Stack(
          children: [
            Container(
              height: 125,
              width: width / 2.3,
              decoration: BoxDecoration(
                color: signup_color,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 65),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          size: 12,
                          color: login_color,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
