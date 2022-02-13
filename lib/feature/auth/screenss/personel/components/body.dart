import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathontemplate/feature/auth/view_model/auth_view_model.dart';

import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import 'background.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthViewModel _authViewModel = AuthViewModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Giriş Yap",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: SvgPicture.asset(
                  "assets/icons/paramedic.svg",
                  height: size.height * 0.35,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                controller: _emailController,
                hintText: "Personel ID",
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
                text: "Giriş Yap",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
