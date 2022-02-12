import 'package:flutter/material.dart';
import 'package:hackathontemplate/feature/accident/accident_screen.dart';
import 'package:hackathontemplate/feature/auth/screens/auth_screen.dart';
import 'package:hackathontemplate/feature/init/screens/init_screen.dart';

import '../../feature/home/screens/home_screen.dart';
import '../../feature/settings/settings_screen.dart';

class Routes {
  Routes._();
  static const String init = '/init';
  static const String home = '/home';
  static const String auth = '/auth';
  static const String accident = '/accident';
  static const String settings = '/settings';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomeScreen(),
    init: (BuildContext context) => InitScreen(),
    auth: (BuildContext context) => AuthScreen(),
    accident: (BuildContext context) => const AccidentScreen(),
    settings: (BuildContext context) => const SettingsScreen(),
  };
}
