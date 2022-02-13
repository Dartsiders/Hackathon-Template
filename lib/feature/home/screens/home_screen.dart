import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/feature/bottom_nav/accident/accident_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/screens/contacts_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/courses/screens/courses_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/screens/main_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/settings/screens/settings_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../core/locator/locator.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return PersistentTabView(
          context,
          controller: _homeViewModel.homeTabController,
          screens: _buildScreens(),
          items: _navBarsItems(),
          backgroundColor: AppTheme.theme.primaryColor.withOpacity(0.3),
          resizeToAvoidBottomInset: true,
          hideNavigationBar: _homeViewModel.isTabHide,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle
              .style16, // Choose the nav bar style with this property.
        );
      },
    );
  }

  List<Widget> _buildScreens() {
    return [
      MainScreen(),
      CoursesScreen(),
      const AccidentScreen(),
      ContactsScreen(),
      const SettingsScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: AppTheme.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.school),
        title: "Courses",
        activeColorPrimary: AppTheme.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppTheme.theme.primaryColor,
        icon: Icon(
          Icons.report_outlined,
          size: 35.sp,
          color: Colors.white,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.contacts),
        title: "Contact",
        activeColorPrimary: AppTheme.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Settings",
        activeColorPrimary: AppTheme.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
