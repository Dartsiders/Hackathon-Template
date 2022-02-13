import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:hackathontemplate/core/app/duration/app_duration.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/screens/contacts_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/view_model/contacts_view_model.dart';
import 'package:hackathontemplate/feature/bottom_nav/courses/screens/lesson_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/courses/screens/quiz1_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/components/contact_avatar_widget.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/components/contact_three.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/components/header_bottom_button_widget.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/view_model/main_view_model.dart';
import 'package:hackathontemplate/feature/home/view_model/home_view_model.dart';
import 'package:hackathontemplate/feature/notification/screens/notification_screen.dart';
import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../../core/locator/locator.dart';
import '../../../../core/services/notification/local_notification_service.dart';
import '../../contacts/components/add_contact_sheet_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainViewModel _mainViewModel = locator<MainViewModel>();

  final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  final ContactsViewModel _contactsViewModel = locator<ContactsViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
            //status bar renk değiştirmiyo sor
            body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: headerTopProfile(),
              ),
              Expanded(
                flex: 3,
                child: headerCenterSpeed(),
              ),
              Expanded(
                flex: 2,
                child: headerBottomButtons(),
              ),
              Expanded(
                flex: 3,
                child: bodyTopContacts(_homeViewModel),
              ),
              Expanded(
                flex: 4,
                child: bodyBottomEducations(_homeViewModel),
              )
            ],
          ),
        ));
      },
    );
  }

  Container headerTopProfile() {
    return Container(
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: AppTheme.theme.primaryColor,
            radius: 24,
            child: _homeViewModel.userModel?.userPhotoUrl != null
                ? Image.network(
                    _homeViewModel.userModel!.userPhotoUrl.toString(),
                  )
                : Text(
                    _homeViewModel.userModel?.userName?.substring(0, 1) ?? "",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
          ),
          //AppSize.lowWidthSizedBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_homeViewModel.userModel?.userName ?? "İsim Soyisim",
                  style: AppTheme.textStyle.headline6),
              const SizedBox(height: 8),
              Text('Gününüz güzel geçsin.', style: AppTheme.textStyle.caption),
            ],
          ),
          AppSize.highWidthSizedBox,
          CircleAvatar(
            radius: 24,
            backgroundColor: AppTheme.theme.dividerColor.withOpacity(0.04),
            child: IconButton(
              color: Colors.black.withOpacity(0.7),
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: NotificationScreen(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container headerCenterSpeed() {
    return Container(
      //color: Colors.deepPurpleAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GroupButton(
                controller: _mainViewModel.mainGroupButtonController,
                onSelected: (index, isSelected) async {
                  _mainViewModel.mainGroupButtonSelectedIndex = index;
                  print(index);
                },
                spacing: 0,
                alignment: Alignment.centerLeft,
                groupingType: GroupingType.row,
                elevation: 0,
                buttonHeight: 50,
                buttonWidth: 105,
                direction: Axis.horizontal,
                buttons: const [
                  "Araç Hızı",
                  "Tehlike Durumu",
                ],

                selectedTextStyle: AppTheme.textStyle.bodyMedium?.copyWith(
                  color: AppTheme.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                unselectedTextStyle: AppTheme.textStyle.bodyMedium?.copyWith(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
                selectedColor: Colors.transparent,
                unselectedColor: Colors.transparent,
                selectedShadow: const [],
                unselectedShadow: const [],

                //buttonHeight: 50,
                //buttonWidth: 100,
              ),
            ],
          ),
          AppSize.lowHeightSizedBox,
          AnimatedCrossFade(
            firstChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _homeViewModel.velocityFromSensors.toString(),
                      style: AppTheme.textStyle.headline3?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSize.lowWidthSizedBox,
                    Text(
                      'km/h',
                      style: AppTheme.textStyle.button?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: null,
                  child: Text(
                    _mainViewModel.autoStatus(),
                    style: AppTheme.textStyle.headline6,
                  ),
                ),
              ],
            ),
            secondChild: Text(
              _mainViewModel.autoStatus(),
              style: AppTheme.textStyle.headline4?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            crossFadeState: _mainViewModel.mainGroupButtonSelectedIndex.isEven
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: AppDuration.lowDuration,
          )
        ],
      ),
    );
  }

  SizedBox headerBottomButtons() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HeaderBottomButtonWidget(
          model: _mainViewModel.headerBottomButtonModelList[index],
        ),
      ),
    );
  }

  Container bodyTopContacts(HomeViewModel homeViewModel) {
    return Container(
      //color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSize.mediumHeightSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kişiler', style: AppTheme.textStyle.headline6),
              TextButton(
                onPressed: () {
                  _homeViewModel.homeTabController.jumpToTab(3);
                },
                child:
                    Text('Tümünü Görüntüle', style: AppTheme.textStyle.caption),
              )
            ],
          ),
          AppSize.lowHeightSizedBox,
          Row(
            /*mainAxisAlignment: _contactsViewModel.emergencyContactList.isEmpty
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,*/
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _contactsViewModel.emergencyContactList.isEmpty
                  ? Text("Kişi Bulunamadı", style: AppTheme.textStyle.headline6)
                  : SizedBox(
                      width: 110,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          _contactsViewModel.emergencyContactList.length > 0
                              ? ContactAvatarWidget(
                                  index: 0,
                                )
                              : SizedBox(),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child:
                                _contactsViewModel.emergencyContactList.length >
                                        1
                                    ? ContactAvatarWidget(
                                        index: 1,
                                      )
                                    : SizedBox(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 58.0),
                            child:
                                _contactsViewModel.emergencyContactList.length >
                                        0
                                    ? ContactAvatarWidget(
                                        index: 2,
                                      )
                                    : SizedBox(),
                          )
                        ],
                      ),
                    ),
              ElevatedButton.icon(
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
                icon: const Icon(Icons.add),
                label: const Text('Kişi Ekle'),
              ),
              /*  InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    color: AppTheme.theme.dividerColor.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(
                        Icons.add,
                        color: Colors.black87,
                      ),

                      AppSize.lowWidthSizedBox,
                      Text('Kişi Ekle',
                          style: AppTheme.textStyle.bodyText2?.copyWith(
                            color: Colors.black87,
                          )),
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ],
      ),
    );
  }

  Container bodyBottomEducations(HomeViewModel homeViewModel) {
    return Container(
      //color: Colors.pink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Günün Sözleri', style: AppTheme.textStyle.headline6),
              TextButton(
                onPressed: () {
                  _homeViewModel.homeTabController.jumpToTab(1);
                },
                child:
                    Text('Tümünü Görüntüle', style: AppTheme.textStyle.caption),
              )
            ],
          ),
          AppSize.lowHeightSizedBox,
          CarouselSlider(
            options: CarouselOptions(height: 150.0, autoPlay: true),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    color: Colors.accents[Random().nextInt(i * 3)]
                        .withOpacity(0.2),
                    elevation: 0,
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            mainAxisAlignment: MainAxisAlignment.end,
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
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class contacts_add extends StatelessWidget {
  const contacts_add({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ContactsScreen()));
      },
      icon: const Icon(Icons.add),
      label: const Text('Kişi Ekle'),
    );
  }
}

class crouselSliders extends StatefulWidget {
  const crouselSliders({
    Key? key,
  }) : super(key: key);

  @override
  State<crouselSliders> createState() => _crouselSlidersState();
}

class _crouselSlidersState extends State<crouselSliders> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 75.0, autoPlay: true),
      items: [
        "İlk yardım ile hayata tutunun.",
        "İlk yardım hayat kurtarır.",
        "İlk yardım sosyal sorumluluktur.",
        "Trafik dikkat ister, azami gayret göster.",
        " Doğru ilk yardım yaşatır."
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                  //color: Colors.amber,
                  ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.purple, Colors.blue])),
                child: Center(
                    child: Text(
                  "$i",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
