import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:finance_mobile_app/widgets/top_tab_bar.dart';
import 'package:flutter/material.dart';

class CreditCardPageWithCreditCard extends StatelessWidget {
  const CreditCardPageWithCreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: login_color,
          width: width,
          height: height / 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: TopTabBar(),
            ),
          ),
        ),
      ],
    ));
  }
}
