import 'package:flutter/material.dart';
import 'package:hackathontemplate/core/routes/routes.dart';
import 'package:hackathontemplate/feature/init/view_model/init_view_model.dart';

import '../../../core/app/navigator/app_navigator.dart';
import '../../../core/locator/locator.dart';

class InitScreen extends StatefulWidget {
  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final InitViewModel _initViewModel = locator<InitViewModel>();

  Future<void> isFirstTime() async {
    final bool isUserExist = await _initViewModel.currentUser();
    //await Future.delayed(Duration(milliseconds: 100));
    if (isUserExist) {
      setState(() {
        AppNavigator(context: context).push(route: Routes.home);
      });
    } else {
      //user yok ise login page e yolla
      setState(() {
        AppNavigator(context: context).push(route: Routes.auth);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
