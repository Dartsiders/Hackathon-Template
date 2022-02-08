import 'package:flutter/material.dart';
import '../view_model/home_view_model.dart';

import '../../../core/locator/locator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
