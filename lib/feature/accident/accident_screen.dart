import 'package:flutter/material.dart';
import 'package:hackathontemplate/core/app/color/app_color.dart';
import 'package:hackathontemplate/feature/accident/viewmodel/accident_viewmodel.dart';

import '../../core/locator/locator.dart';
import '../init/view_model/init_view_model.dart';

class AccidentScreen extends StatefulWidget {
  const AccidentScreen({Key? key}) : super(key: key);

  @override
  _AccidentScreenState createState() => _AccidentScreenState();
}

class _AccidentScreenState extends State<AccidentScreen> {
  final AccidentViewModel _accidentViewModel = AccidentViewModel();
  final InitViewModel _initViewModel = locator<InitViewModel>();

  @override
  void initState() {
    _initViewModel.setLocationPermission();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: AppColor.greenColor,
              height: 250,
              child: const Center(
                child: Text('Accident'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
