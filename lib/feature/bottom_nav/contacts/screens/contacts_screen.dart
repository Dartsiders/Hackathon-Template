import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/core/app/theme/app_text_theme.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/view_model/contacts_view_model.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../../core/locator/locator.dart';
import '../../../home/view_model/home_view_model.dart';
import '../components/add_contact_sheet_widget.dart';

class ContactsScreen extends StatelessWidget {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();
  final ContactsViewModel _contactsViewModel = locator<ContactsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 250.0,
            actions: [
              TextButton(
                onPressed: () {
                  _homeViewModel.isTabHide = true;
                  final a = showModalBottomSheet<void>(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return AddContactSheetWidget();
                    },
                  );
                  a.whenComplete(() => _homeViewModel.isTabHide = false);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    AppSize.lowWidthSizedBox,
                    Text(
                      "Kişi Ekle",
                      style: AppTheme.theme.textTheme.button?.copyWith(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              expandedTitleScale: 1.2,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 20,
                      top: 30,
                      right: 20,
                    ),
                    child: Text(
                      'Kişiler',
                      style: AppTheme.theme.textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1,
                    ),
                  ),
                ],
              ),
            ),
            floating: true,
            pinned: true,
            snap: true,
          ),
        ],
        body: FutureBuilder(
          future: _contactsViewModel.getEmergencyContactList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: _contactsViewModel.emergencyContactList.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Item ${_contactsViewModel.emergencyContactList[index].emergencyContactName}',
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
