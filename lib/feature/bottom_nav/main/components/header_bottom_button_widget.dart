import 'package:flutter/material.dart';

import 'package:hackathontemplate/feature/bottom_nav/main/components/header_bottom_button_model.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/screens/info_card_detail_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../../core/app/size/app_size.dart';
import '../../../../core/app/theme/app_theme.dart';
import '../../../notification/screens/notification_screen.dart';

class HeaderBottomButtonWidget extends StatelessWidget {
  final HeaderBottomButtonModel model;
  const HeaderBottomButtonWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () {
          pushNewScreen(
            context,
            screen: InfoCardDetailScreen(model: model),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Container(
          height: 150,
          width: 130,
          decoration: BoxDecoration(
            color: model.color?.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: model.color,
                child: Icon(
                  model.icon,
                  color: Colors.white,
                ),
              ),
              AppSize.mediumHeightSizedBox,
              Text(
                model.text.toString(),
                style: AppTheme.textStyle.button?.copyWith(
                  color: model.color,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
