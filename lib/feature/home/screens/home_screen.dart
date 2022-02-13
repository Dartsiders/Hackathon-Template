import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/core/services/notification/local_notification_service.dart';
import 'package:hackathontemplate/feature/bottom_nav/accident/accident_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/screens/contacts_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/courses/screens/courses_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/screens/main_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/settings/screens/settings_screen.dart';
import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../view_model/home_view_model.dart';

import '../../../core/locator/locator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();
  final LocalNotificationService _localNotificationService =
      locator<LocalNotificationService>();

  @override
  void initState() {
    super.initState();
    _homeViewModel.listenVelocityFromSensors();
    reaction(
      (_) => _homeViewModel.isStatusEmergency,
      (isStatusEmergency) async {
        if (isStatusEmergency == true) {
          await _homeViewModel.getCurrentPositionFromGPS();
          _localNotificationService
              .showNotifications(
                id: 0,
                title: "Acil Durum Bildirisi",
                body:
                    "Acil Durumu Bu Bildirime tıklayarak iptal etmezseniz tehlikede olduğunuz bildirilecek",
              )
              .then((value) => {
                    Future.delayed(Duration(
                      minutes: 2,
                    )).then((value) async => {
                          if (_homeViewModel.isStatusEmergency == true)
                            {await _homeViewModel.saveAutoEmergency()}
                        })
                  });

          /* ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Emergency Status',
              ),
            ),
          );*/
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return PersistentTabView(
        context,
        controller: _homeViewModel.homeTabController,
        screens: _buildScreens(),
        items: _navBarsItems(),

        backgroundColor: AppTheme.theme.primaryColor.withOpacity(0.3),
        resizeToAvoidBottomInset: true,
        hideNavigationBar: _homeViewModel.isTabHide,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
          colorBehindNavBar: Colors.white,
        ),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),
        navBarStyle:
            NavBarStyle.style16, // Choose the nav bar style with this property.
      );
    });
  }

  List<Widget> _buildScreens() {
    return [
      MainScreen(),
      CoursesScreen(),
      AccidentScreen(),
      ContactsScreen(),
      SettingsScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: AppTheme.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.school),
        title: ("Courses"),
        activeColorPrimary: AppTheme.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppTheme.theme.colorScheme.secondary,
        title: "Kaza Bildir",
        textStyle: AppTheme.theme.textTheme.button?.copyWith(
          color: AppTheme.theme.colorScheme.secondary,
        ),
        onSelectedTabPressWhenNoScreensPushed: () {},
        onPressed: (p0) {
          pushNewScreen(
            context,
            screen: AccidentScreen(),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        icon: Icon(
          Icons.report_gmailerrorred_outlined,
          color: Colors.white,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.contacts),
        title: ("Contact"),
        activeColorPrimary: AppTheme.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: AppTheme.theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
