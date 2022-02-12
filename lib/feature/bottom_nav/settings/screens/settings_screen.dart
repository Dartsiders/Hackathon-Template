import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/app/size/app_size.dart';
import '../../../../core/app/theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.transparent,
          leading: CircleAvatar(
              radius: 18,
              child:
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: headerProfile()),
              Expanded(flex: 5, child: bodyListTile()),
            ],
          ),
        ),
      );
    });
  }

  Container headerProfile() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings",
                style: AppTheme.textStyle.headline4!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black87)),
            AppSize.mediumHeightSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 36,
                    ),
                    AppSize.lowHeightSizedBox,
                    Text('Kullanıcı İsmi', style: AppTheme.textStyle.headline6),
                    Text('KUllanıcı mail', style: AppTheme.textStyle.caption),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit),
                        AppSize.lowWidthSizedBox,
                        Text('Profili Düzenle',
                            style: AppTheme.textStyle.bodyText2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Container bodyListTile() => Container(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 20,

                child: Icon(Icons.info),
                //tamamlandı ise tik olsun
              ),
              title: Text('Bildirimler', style: AppTheme.textStyle.bodyText2),
              subtitle: Text('Bildirim açıklama',
                  style: AppTheme.textStyle.bodyText2),
            )
          ],
        ),
      );
}
