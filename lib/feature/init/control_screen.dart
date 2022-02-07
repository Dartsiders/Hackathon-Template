import 'package:flutter/material.dart';
import 'package:hackathontemplate/feature/init/view_model/init_view_model.dart';

import '../../core/locator/locator.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({ Key? key }) : super(key: key);

  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {

  final InitViewModel _initViewModel = locator<InitViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}