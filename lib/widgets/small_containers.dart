import 'package:flutter/material.dart';

import 'constants.dart';

class SmallContainers extends StatelessWidget {
  final IconData? icon;
  final Function()? ontap;
  final String text;
  const SmallContainers(
      {Key? key, required this.ontap, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Container(
              height: 125,
              width: width / 2.5,
              decoration: BoxDecoration(
                color: signup_color,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
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
                            size: 28,
                            color: login_color,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'date',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            icon,
                            size: 32,
                            color: login_color,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
