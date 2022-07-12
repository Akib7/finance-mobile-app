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
              ),
            ),
          ],
        )
      ],
    );
  }
}
