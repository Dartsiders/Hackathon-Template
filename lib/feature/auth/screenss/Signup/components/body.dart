import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathontemplate/feature/auth/components/rounded_button.dart';
import 'package:hackathontemplate/feature/auth/view_model/auth_view_model.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/rounded_input_field.dart';
// ignore: always_use_package_imports
import '../../../components/rounded_password_field.dart';
import '../../Login/login_screen.dart';
import 'background.dart';
import 'or_divider.dart';
import 'social_icon.dart';

class Body extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthViewModel _authViewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "assets/icons/akciger.svg",
              height: size.height * 0.3,
            ),
            RoundedInputField(
              controller: _nameController,
              hintText: "Your Name",
              onChanged: (value) {
                _authViewModel.onNameChanged(value);
              },
            ),
            RoundedInputField(
              controller: _emailController,
              hintText: "Your Email",
              onChanged: (value) {
                _authViewModel.onEmailChanged(value);
              },
            ),
            RoundedPasswordField(
              controller: _passwordController,
              onChanged: (value) {
                _authViewModel.onPassChange(value);
              },
            ),
            RoundedButton(
              press: () {
                _authViewModel.createAccount(context);
              },
              text: "SIGNUP",
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {
                    _authViewModel.signInWithGoogle(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
