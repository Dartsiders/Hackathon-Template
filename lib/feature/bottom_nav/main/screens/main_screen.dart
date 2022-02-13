import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:group_button/group_button.dart';
import 'package:hackathontemplate/core/app/duration/app_duration.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/screens/contacts_screen.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/components/contact_avatar_two.widget.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/components/contact_avatar_widget.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/components/contact_three.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/components/header_bottom_button_widget.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/view_model/main_view_model.dart';
import 'package:hackathontemplate/feature/home/view_model/home_view_model.dart';

import '../../../../core/locator/locator.dart';

class MainScreen extends StatelessWidget {
  final MainViewModel _mainViewModel = locator<MainViewModel>();
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          //status bar renk değiştirmiyo sor
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: headerTopProfile(),
                ),
                Expanded(
                  flex: 2,
                  child: headerCenterSpeed(),
                ),
                Expanded(
                  flex: 2,
                  child: headerBottomButtons(),
                ),
                Expanded(
                  flex: 2,
                  child: bodyTopContacts(_homeViewModel),
                ),
                Expanded(
                  flex: 2,
                  child: bodyBottomEducations(_homeViewModel),
                )
              ],
            ),
          ),
        );
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
          ),
          //AppSize.lowWidthSizedBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kullanıcı İsmi', style: AppTheme.textStyle.headline6),
              const SizedBox(height: 8),
              Text('Günaydın', style: AppTheme.textStyle.caption),
            ],
          ),
          AppSize.highWidthSizedBox,

          CircleAvatar(
            radius: 24,
            backgroundColor: AppTheme.theme.dividerColor.withOpacity(0.04),
            child: IconButton(
              color: Colors.black.withOpacity(0.7),
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
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
                buttonWidth: 100,
                direction: Axis.horizontal,
                buttons: const [
                  "Araç Hızı",
                  "Rasgele Tab",
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
                      '0.0',
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
                  onPressed: () {},
                  child: Text(
                    'Stabil',
                    style: AppTheme.textStyle.headline6,
                  ),
                ),
              ],
            ),
            secondChild: const Text("Rasgele Tab Text"),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Contactthree(),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: ContactAvatarWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 58.0),
                      child: ContacttwoWidget(),
                    )
                  ],
                ),
              ),
              contacts_add(),
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
          crouselSliders(),
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
                child: Center(child: Text("$i",style: TextStyle(color: Colors.white),)),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
