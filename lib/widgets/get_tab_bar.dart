import 'package:finance_mobile_app/providers/user_provider.dart';
import 'package:finance_mobile_app/screens/landingPage1.dart';
import 'package:finance_mobile_app/screens/tabBarMenu.dart';
import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../screens/money.dart';
import '../screens/wallet.dart';

class GetTabBar extends StatefulWidget {
  late UserProvider userProvider;
  GetTabBar({Key? key, required this.userProvider}) : super(key: key);

  @override
  _GetTabBarState createState() => _GetTabBarState();
}

class _GetTabBarState extends State<GetTabBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        // confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        // handleAndroidBackButtonPress: true, // Default is true.
        // resizeToAvoidBottomInset:
        //     true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        // stateManagement: true, // Default is true.
        // hideNavigationBarWhenKeyboardShows:
        //     true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: login_color,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      TabBarMenu(
        userProvider: widget.userProvider,
      ),
      const Wallet(),
      const Money(),
      const LandingPage1(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        // title: ("Profile"),
        iconSize: 30,
        activeColorPrimary: login_color,
        inactiveColorPrimary: CupertinoColors.black.withOpacity(0.7),
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: const Icon(CupertinoIcons.table),
        // title: ("Table"),
        activeColorPrimary: login_color,
        inactiveColorPrimary: CupertinoColors.black.withOpacity(0.7),
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: const Icon(CupertinoIcons.money_dollar),
        // title: ("Money"),
        activeColorPrimary: login_color,
        inactiveColorPrimary: CupertinoColors.black.withOpacity(0.7),
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: const Icon(CupertinoIcons.dot_square),
        // title: ("Menu"),
        activeColorPrimary: login_color,
        inactiveColorPrimary: CupertinoColors.black.withOpacity(0.7),
      ),
    ];
  }
}
