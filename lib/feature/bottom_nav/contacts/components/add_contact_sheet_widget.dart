import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackathontemplate/core/app/theme/app_text_theme.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/view_model/contacts_view_model.dart';
import 'package:hackathontemplate/feature/widgets/rounded_loading_extended_button_widget.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/locator/locator.dart';

class AddContactSheetWidget extends StatefulWidget {
  @override
  State<AddContactSheetWidget> createState() => _AddContactSheetWidgetState();
}

class _AddContactSheetWidgetState extends State<AddContactSheetWidget> {
  final ContactsViewModel _contactsViewModel = locator<ContactsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
          padding: EdgeInsets.all(8),
          height: 600,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kişi Ekleme',
                style: AppTheme.theme.textTheme.headline4?.copyWith(
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 60),
              Form(
                key: _contactsViewModel.addContactFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () async => await _contactsViewModel
                            .pickContactProfilePicture(context),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.blueAccent,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 58,
                            backgroundImage:
                                _contactsViewModel.imageFile != null
                                    ? FileImage(
                                        _contactsViewModel.imageFile!,
                                      ) as ImageProvider
                                    : null,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    contactNameTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    phoneNumberImput(),
                    const SizedBox(
                      height: 20,
                    ),
                    addContactButton(),
                  ],
                ),
              ),
            ],
          ));
    });
  }

  TextFormField contactNameTextField() {
    return TextFormField(
      onSaved: (newValue) {
        _contactsViewModel.emergencyContactModel.emergencyContactName =
            newValue;
      },
      initialValue: "",
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.account_circle_rounded),
        labelText: "İsim Soyisim",
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        //fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return "Boş olamaz";
        } else {
          //return 'Hatasız';
        }
      },
    );
  }

  InternationalPhoneNumberInput phoneNumberImput() {
    return InternationalPhoneNumberInput(
      errorMessage: "Telefon numaranızı doğru girdiğinizden emin olun.",
      maxLength: 13,
      inputDecoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: 'Telefon Numarası',
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        //fillColor: Colors.blueAccent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        //hintText: '555 555 55 55',
        helperText: "Telefon Numarasınız başında 0 olmadan giriniz",
      ),
      countries: const ["TR"],
      countrySelectorScrollControlled: false,
      spaceBetweenSelectorAndTextField: 0,
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
        trailingSpace: false,
        setSelectorButtonAsPrefixIcon: true,
        showFlags: false,
      ),
      //autoValidateMode: AutovalidateMode.onUserInteraction,
      selectorTextStyle: const TextStyle(fontSize: 16),
      initialValue: PhoneNumber(
        isoCode: 'TR',
        //phoneNumber: "5551752190",
        dialCode: "+90",
      ),
      formatInput: false,
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      inputBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onInputChanged: (PhoneNumber phoneNumber) {
        _contactsViewModel.emergencyContactModel.emergencyContactPhoneNumber =
            phoneNumber.toString();
      },
      validator: (String? phoneNumber) {
        if (phoneNumber!.length != 10) {
          return "Telefon numaranızı doğru girdiğinizden emin olun.";
        }
      },
      onSaved: (PhoneNumber phoneNumber) async {
        _contactsViewModel.emergencyContactModel.emergencyContactPhoneNumber =
            phoneNumber.toString();
      },
    );
  }

  Align addContactButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          RoundedLoadingExtendedButtonWidget(
            "Kaydet",
            _contactsViewModel.addContactButtonController,
            () async {
              final val =
                  _contactsViewModel.addContactFormKey.currentState?.validate();
              if (val == true) {
                _contactsViewModel.addContactFormKey.currentState?.save();
                await _contactsViewModel.saveContactDatabase();
                Navigator.pop(context);
              }
              _contactsViewModel.addContactButtonController.stop();
              //_authenticationViewModel.personalInfoSave(context);
            },
          )
        ],
      ),
    );
  }
}
