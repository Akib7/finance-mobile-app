import 'package:finance_mobile_app/Constants/firebase_auth_constants.dart';
import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:finance_mobile_app/widgets/get_tab_bar.dart';
import 'package:flutter/material.dart';

class MyMainMenu extends StatelessWidget {
  const MyMainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.dashboard_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: login_color,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              authController.logout();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: const GetTabBar(),
    );
  }
}
