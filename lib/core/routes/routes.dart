import 'package:flutter/material.dart';
import '../../feature/init/control_screen.dart';

import '../../feature/home/screens/home_screen.dart';

class Routes {
  Routes._();
  static const String control = '/control';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomeScreen(),
    control: (BuildContext context) => const ControlScreen(),
  };
}
