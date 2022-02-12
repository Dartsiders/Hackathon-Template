import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:group_button/group_button.dart';
import 'package:hackathontemplate/core/app/duration/app_duration.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/feature/home/view_model/home_view_model.dart';

import '../../../../core/locator/locator.dart';

class MainScreen extends StatelessWidget {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: headerTopProfile(),
                ),
                Expanded(
                  child: headerCenterSpeed(),
                ),
                Expanded(
                  child: headerBottomButtons(),
                ),
                Expanded(
                  child: bodyTopFavourites(),
                ),
                Expanded(
                  flex: 2,
                  child: bodyBottomEducations(),
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
          const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 24,
          ),
          //AppSize.lowWidthSizedBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kullanıcı İsmi', style: AppTheme.textStyle.headline6),
              Text('Günaydın', style: AppTheme.textStyle.caption),
            ],
          ),
          AppSize.highWidthSizedBox,
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.filter_alt_outlined),
              onPressed: () {},
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              color: Colors.white,
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
                controller: _homeViewModel.mainGroupButtonController,
                onSelected: (index, isSelected) async {
                  _homeViewModel.mainGroupButtonSelectedIndex = index;
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

                selectedTextStyle: AppTheme.textStyle.subtitle1?.copyWith(
                  color: Colors.blue,
                ),
                unselectedTextStyle: AppTheme.textStyle.subtitle1
                    ?.copyWith(color: Colors.black45),
                selectedColor: Colors.transparent,
                unselectedColor: Colors.transparent,
                selectedShadow: const [],
                unselectedShadow: const [],

                //buttonHeight: 50,
                //buttonWidth: 100,
              ),
            ],
          ),
          AnimatedCrossFade(
            firstChild: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('0.0', style: AppTheme.textStyle.headline3),
                AppSize.lowWidthSizedBox,
                Text('km/h', style: AppTheme.textStyle.button),
              ],
            ),
            secondChild: const Text("Rasgele Tab Text"),
            crossFadeState: _homeViewModel.mainGroupButtonSelectedIndex.isEven
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: AppDuration.lowDuration,
          )
        ],
      ),
    );
  }

  Container headerBottomButtons() {
    return Container(
      //color: Colors.red,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.notifications_outlined),
                  ),
                  AppSize.mediumHeightSizedBox,
                  Text('Bildirimler', style: AppTheme.textStyle.caption),
                ],
              ),
            ),
          ),
          AppSize.lowWidthSizedBox,
          InkWell(
            onTap: () {},
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.place),
                  ),
                  AppSize.mediumHeightSizedBox,
                  Text('Güvenli Bölgeler', style: AppTheme.textStyle.caption),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container bodyTopFavourites() {
    return Container(
      //color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Favoriler', style: AppTheme.textStyle.headline6),
          AppSize.mediumHeightSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Align(
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add),
                      AppSize.lowWidthSizedBox,
                      Text('Kişi Ekle', style: AppTheme.textStyle.bodyText2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container bodyBottomEducations() {
    return Container(
      //color: Colors.pink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Eğitimler', style: AppTheme.textStyle.headline6),
          AppSize.mediumHeightSizedBox,
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.red,
                child: Icon(Icons.info),
                //tamamlandı ise tik olsun
              ),
            ),
            title: Text('Örnek Eğitim', style: AppTheme.textStyle.bodyText2),
            subtitle: Text(
              'Eğitimin açıklaması ',
              style: AppTheme.textStyle.bodyText2,
            ),
            trailing: SizedBox(
              width: 90,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.filter_alt_outlined),
                      onPressed: () {},
                    ),
                  ),
                  AppSize.lowWidthSizedBox,
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.notifications_outlined),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
