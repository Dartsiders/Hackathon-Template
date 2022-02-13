import 'package:flutter/material.dart';
import 'package:hackathontemplate/feature/bottom_nav/accident/accident_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/courses/screens/courses_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/screens/main_screen.dart';
import 'package:hackathontemplate/feature/init/screens/init_screen.dart';

import '../../feature/auth/screenss/Welcome/welcome_screen.dart';
import '../../feature/auth/screenss/verification/verification_screen.dart';
import '../../feature/bottom_nav/contacts/screens/contacts_screen.dart';
import '../../feature/bottom_nav/settings/screens/settings_screen.dart';
import '../../feature/home/screens/home_screen.dart';

class Routes {
  Routes._();
  static const String init = '/init';
  static const String auth = '/auth';

  static const String home = '/home';

  static const String main = '/main';
  static const String courses = '/courses';
  static const String accident = '/accident';
  static const String contacts = '/contacts';
  static const String settings = '/settings';
  static const String verification = '/verification';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomeScreen(),
    init: (BuildContext context) => InitScreen(),
    auth: (BuildContext context) => WelcomeScreen(),
    main: (BuildContext context) => MainScreen(),
    courses: (BuildContext context) => CoursesScreen(),
    accident: (BuildContext context) => const ReportEmergency(),
    contacts: (BuildContext context) => ContactsScreen(),
    settings: (BuildContext context) => const SettingsScreen(),
    verification: (BuildContext context) => const VerificationScreen(),
  };
}
