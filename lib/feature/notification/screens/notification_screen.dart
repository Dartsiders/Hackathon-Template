import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/core/app/theme/app_text_theme.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/view_model/contacts_view_model.dart';
import 'package:hackathontemplate/feature/notification/view_model/notification_view_model.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../../core/locator/locator.dart';
import '../../home/view_model/home_view_model.dart';

class NotificationScreen extends StatelessWidget {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();
  final NotificationViewModel _notificationViewModel =
      locator<NotificationViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            leading: BackButton(),
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Bildirimler',
                style: AppTheme.theme.textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1,
              ),
            ),
            floating: true,
            pinned: true,
            snap: true,
          ),
        ],
        body: FutureBuilder(
          future: _notificationViewModel.getAutoEmergencyList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: _notificationViewModel.autoEmergencyList.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Bildirim Zamanı: ${_notificationViewModel.autoEmergencyList[index].autoEmergencyTime}',
                  ),
                  subtitle: Text(
                    'Bildirim Konumu: ${_notificationViewModel.autoEmergencyList[index].autoEmergencyLocationLatitude}&&${_notificationViewModel.autoEmergencyList[index].autoEmergencyLocationLongitude}',
                  ),
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
