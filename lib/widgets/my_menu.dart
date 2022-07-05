import 'package:finance_mobile_app/Constants/firebase_auth_constants.dart';
import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:finance_mobile_app/widgets/get_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class MyMainMenu extends StatefulWidget {
  const MyMainMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<MyMainMenu> createState() => _MyMainMenuState();
}

class _MyMainMenuState extends State<MyMainMenu> {
  @override
  void initState() {
    UserProvider userProvider = Provider.of(context, listen: false);
    userProvider.getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
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
      body: GetTabBar(
        userProvider: userProvider,
      ),
    );
  }
}
