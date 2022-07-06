import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class CreditCardsPage extends StatelessWidget {
  const CreditCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: _buildCreditCard(
                          color: login_color,
                          cardExpiration: "08/2022",
                          cardHolder: "HOUSSEM SELMI",
                          cardNumber: "3546 7532 XXXX 9742",
                          gradient1: login_color,
                          gradient2: login_color),
                    ),
                    _buildCreditCard(
                      color: signup_color,
                      cardExpiration: "05/2024",
                      cardHolder: "HOUSSEM SELMI",
                      cardNumber: "9874 4785 XXXX 6548",
                      gradient1: signup_color2,
                      gradient2: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // _buildCreditCard(
              //     color: signup_color,
              //     cardExpiration: "05/2024",
              //     cardHolder: "HOUSSEM SELMI",
              //     cardNumber: "9874 4785 XXXX 6548"),
              _buildAddCardButton(
                icon: const Icon(Icons.add),
                color: const Color(0xFF081603),
              )
            ],
          ),
        ),
      ],
    );
  }

  // Build the title section

  // Build the credit card widget
  Card _buildCreditCard(
      {required Color color,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration,
      required Color gradient1,
      required Color gradient2}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              colors: [gradient1, gradient2],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                cardNumber,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Build the top row containing logos
  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/wi.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "assets/master.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

// Build the FloatingActionButton
  Container _buildAddCardButton({
    required Icon icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      alignment: Alignment.center,
      child: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          print("Add a credit card");
        },
        backgroundColor: color,
        mini: false,
        child: icon,
      ),
    );
  }
}
