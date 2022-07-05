import 'package:finance_mobile_app/screens/card_application_vertical.dart';

import 'package:flutter/material.dart';

import 'card_application.dart';

class GetItems extends StatelessWidget {
  const GetItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Activities',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 120,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Monthly Report',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'OpenSans',
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CardApplication(
                title: 'Loan',
              ),
            ),
            CardApplicationVertical(
              title: 'Requests',
            )
          ],
        ),
      ],
    );
  }
}
