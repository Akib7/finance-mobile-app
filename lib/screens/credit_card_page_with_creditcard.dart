import 'package:flutter/material.dart';

import '../widgets/credit_card_page.dart';

class CreditCardPageWithCreditCard extends StatelessWidget {
  const CreditCardPageWithCreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreditCardsPage(),
    );
  }
}
