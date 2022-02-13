import 'package:flutter/material.dart';

import '../../../../core/app/theme/app_theme.dart';

class ContacttwoWidget extends StatelessWidget {
  const ContacttwoWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: 24,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 22,
        //backgroundColor:  AppTheme.theme.primaryColor,
       backgroundImage:
                    AssetImage("assets/images/girl.jpg"),
               // backgroundColor: Colors.transparent,
                
      ),
    );
  }
}