import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:finance_mobile_app/widgets/top_tab_bar.dart';

import 'package:flutter/material.dart';

class CreditCardPageWithCreditCard extends StatelessWidget {
  const CreditCardPageWithCreditCard({Key? key}) : super(key: key);

  Container _buildAddCardButton({
    required Icon icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      alignment: Alignment.topRight,
      child: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          print("Add a credit card");
        },
        backgroundColor: color,
        mini: true,
        child: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
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
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: TopTabBar(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 35.0),
                child: _buildAddCardButton(
                  icon: const Icon(
                    Icons.add,
                  ),
                  color: login_color,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
