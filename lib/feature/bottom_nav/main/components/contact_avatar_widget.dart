import 'package:flutter/material.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/view_model/contacts_view_model.dart';
import 'package:hackathontemplate/feature/home/view_model/home_view_model.dart';

import '../../../../core/app/theme/app_theme.dart';
import '../../../../core/locator/locator.dart';

class ContactAvatarWidget extends StatelessWidget {
  ContactsViewModel _contactsViewModel = locator<ContactsViewModel>();
  final int? index;

  ContactAvatarWidget({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: AppTheme.theme.primaryColor,
        child: _contactsViewModel.emergencyContactList[index!].emergencyContactPhotoUrl!=null
            ? Image.network(
                _contactsViewModel.emergencyContactList[index!].emergencyContactPhotoUrl.toString(),
              )
            : Text(
                _contactsViewModel.emergencyContactList[index!].emergencyContactName?.substring(0, 1)  ?? "",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
