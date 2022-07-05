// ignore_for_file: file_names
import 'package:finance_mobile_app/UserProfile/Utils/userPreferences.dart';
import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:finance_mobile_app/widgets/get_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/credit_card_page_with_creditcard.dart';

import 'UserProfileWidgets/user_profile_widget.dart';
import 'get_items.dart';

class GrabImages extends StatelessWidget {
  final user = UserPreference.myUser;

  // final imagePiece = ProfileWidget.
  GrabImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 80,
            horizontal: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ProfileWidget(
                          image: user.image,
                          onClicked: () async {},
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      // vertical: 130,
                      horizontal: 68,
                    ),
                    child: Column(
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        const Text(
                          '\$' + '4,763.40',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Available Balance',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const GetItems(),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const CreditCardPageWithCreditCard());
          },
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 38, horizontal: 65),
                  child: Column(
                    children: const [
                      Icon(
                        CupertinoIcons.arrow_up_square,
                        size: 40,
                        color: login_color,
                      ),
                      Text(
                        "Topup",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
