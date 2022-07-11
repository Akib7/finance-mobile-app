import 'package:flutter/material.dart';

import 'constants.dart';

class SmallContainers extends StatefulWidget {
  final IconData? icon;
  final Function()? ontap;
  final String text;

  SmallContainers({
    Key? key,
    required this.ontap,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  State<SmallContainers> createState() => _SmallContainersState();
}

class _SmallContainersState extends State<SmallContainers> {
  late Color color = signup_color;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Container(
              height: 125,
              width: width / 2.5,
              decoration: BoxDecoration(
                color: color,
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
                          widget.text,
                          style: TextStyle(
                            color: widget.text == 'Bills'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 18,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              color = login_color;
                            });
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 28,
                            color: widget.text == 'Bills'
                                ? Colors.white
                                : login_color,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'date',
                          style: TextStyle(
                            color: widget.text == 'Bills'
                                ? Colors.white
                                : Colors.blueGrey,
                            fontSize: 13,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            widget.icon,
                            size: 32,
                            color: widget.text == 'Bills'
                                ? Colors.white
                                : login_color,
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
