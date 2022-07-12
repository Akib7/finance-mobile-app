import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../screens/transaction.dart';
import 'credit_card_page.dart';

class TopTabBar extends StatefulWidget {
  const TopTabBar({Key? key}) : super(key: key);

  @override
  _TopTabBarState createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: ButtonsTabBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  unselectedBackgroundColor:
                      Theme.of(context).scaffoldBackgroundColor,
                  unselectedLabelStyle:
                      const TextStyle(color: Colors.black, fontSize: 16),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  tabs: const [
                    Tab(
                      text: "My Cards",
                    ),
                    Tab(
                      text: "Deposits",
                    ),
                    Tab(
                      text: "Transactions",
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: CreditCardsPage(),
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Transaction(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
