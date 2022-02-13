import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:hackathontemplate/feature/bottom_nav/main/components/header_bottom_button_model.dart';

import '../../../../core/app/size/app_size.dart';
import '../../../../core/app/theme/app_theme.dart';

class InfoCardDetailScreen extends StatelessWidget {
  final HeaderBottomButtonModel model;
  const InfoCardDetailScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: model.color?.withOpacity(0.2),
        leading: BackButton(
          color: model.color,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: model.color?.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: model.color,
                    child: Icon(
                      model.icon,
                      size: 52,
                      color: Colors.white,
                    ),
                  ),
                  AppSize.mediumHeightSizedBox,
                  Text(
                    model.text.toString(),
                    style: AppTheme.textStyle.headline6?.copyWith(
                      color: model.color,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: CarouselSlider(
              options: CarouselOptions(autoPlay: true),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: model.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'text ',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
