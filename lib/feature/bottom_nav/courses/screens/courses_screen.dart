import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/core/app/theme/app_text_theme.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/feature/auth/screenss/Quiz/quiz_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/view_model/contacts_view_model.dart';
import 'package:hackathontemplate/feature/bottom_nav/courses/screens/lesson_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/courses/screens/quiz1_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../../core/locator/locator.dart';
import '../../../home/view_model/home_view_model.dart';
import '../../contacts/components/add_contact_sheet_widget.dart';

class Courses1Screen extends StatelessWidget {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();
  final ContactsViewModel _contactsViewModel = locator<ContactsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 250.0,
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
                      'Kurslar',
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
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, i) => Container(
                  height: 300,
                  width: double.infinity,
                  child: Card(
                      color: Colors.white,
                      elevation: 4,
                      margin: const EdgeInsets.all(15),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Placeholder(
                              fallbackHeight: 120,
                              color: Colors.grey,
                            ),
                            AppSize.lowHeightSizedBox,
                            Text(
                              'Kurs İsmi',
                              style: AppTheme.theme.textTheme.headline5,
                            ),
                            AppSize.lowHeightSizedBox,
                            Text(
                              'Kurs Açıklama',
                              style: AppTheme.theme.textTheme.caption,
                            ),
                            AppSize.lowHeightSizedBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      pushNewScreen(
                                        context,
                                        screen: QuizScreen1(),
                                        withNavBar:
                                            false, // OPTIONAL VALUE. True by default.
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                      );
                                    },
                                    child: Text("Sınava Gir")),
                                AppSize.lowWidthSizedBox,
                                ElevatedButton(
                                  onPressed: () {
                                    pushNewScreen(
                                      context,
                                      screen: LessonScreen(),
                                      withNavBar:
                                          false, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    );
                                  },
                                  child: Text("Derse Gir"),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                )),
      ),
    );
  }
}
