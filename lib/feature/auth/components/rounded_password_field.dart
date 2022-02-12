import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackathontemplate/feature/auth/view_model/auth_view_model.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final AuthViewModel _authViewModel = AuthViewModel();
  RoundedPasswordField({
    Key? key,
    this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Observer(
        builder: (a) => TextFormField(
          validator: (value) => value!.isEmpty ? 'Şifre Boş Geçilemez' : null,
          obscureText: !_authViewModel.isPasswordVisible,
          onChanged: onChanged,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            hintText: "Password",
            icon: const Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _authViewModel.changePasswordVisibility();
              },
              icon: _authViewModel.isPasswordVisible == true
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              color: kPrimaryColor,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
