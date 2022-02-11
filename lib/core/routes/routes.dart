import 'package:flutter/material.dart';
import 'package:hackathontemplate/feature/auth/screens/auth_screen.dart';
import 'package:hackathontemplate/feature/init/screens/init_screen.dart';

import '../../feature/home/screens/home_screen.dart';

class Routes {
  Routes._();
  static const String init = '/init';
  static const String home = '/home';
  static const String auth = '/auth';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomeScreen(),
    init: (BuildContext context) => InitScreen(),
    auth: (BuildContext context) => AuthScreen(),
  };
}
