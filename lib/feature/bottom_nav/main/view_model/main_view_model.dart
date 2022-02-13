import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/components/header_bottom_button_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/app/theme/app_theme.dart';
part 'main_view_model.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store {
  @observable
  GroupButtonController mainGroupButtonController = GroupButtonController(
    selectedIndex: 0,
  );

  @observable
  int mainGroupButtonSelectedIndex = 0;

  @observable
  List<HeaderBottomButtonModel> headerBottomButtonModelList = [
    HeaderBottomButtonModel(
      icon: Icons.local_hospital_outlined,
      text: 'Acil Durum Bilgileri',
      color: AppTheme.theme.primaryColor,
    ),
    HeaderBottomButtonModel(
      icon: Icons.healing_outlined,
      text: 'Yüksek Hız Kontrolü',
      color: Colors.blueAccent,
    ),
    HeaderBottomButtonModel(
      icon: Icons.medical_services_outlined,
      text: 'Acil Durum Bilgileri',
      color: Colors.green,
    ),
  ];
}
