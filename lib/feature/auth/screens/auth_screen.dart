import 'package:flutter/material.dart';
import 'package:hackathontemplate/feature/auth/view_model/auth_view_model.dart';

import '../../../core/locator/locator.dart';

class AuthScreen extends StatelessWidget {

  final AuthViewModel _authViewModel = locator<AuthViewModel>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('AuthScreen'),
      ),
    );
  }
}
