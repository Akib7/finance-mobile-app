import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('See all Transactions'),
                style: ElevatedButton.styleFrom(
                    primary: login_color,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
