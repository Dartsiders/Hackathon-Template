import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator({
    required BuildContext context,
  }) : _context = context;

  final BuildContext? _context;

 void push({required String route}) {
    Navigator.pushNamed(_context!, route);
  }

 void popUntilFirst() {
    Navigator.of(_context!).popUntil((route) => route.isFirst);
  }

 void pop() {
    Navigator.pop(_context!);
  }
}
