import 'package:flutter/material.dart';

import '../../../../core/app/theme/app_theme.dart';

class ContactAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 22,
        backgroundColor:  AppTheme.theme.primaryColor,
      ),
    );
  }
}
