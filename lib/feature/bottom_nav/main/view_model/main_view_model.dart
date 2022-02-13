import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/components/header_bottom_button_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/app/theme/app_theme.dart';
import '../../../../core/locator/locator.dart';
import '../../../home/view_model/home_view_model.dart';

part 'main_view_model.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();

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

 

  @action
  String autoStatus() {
    if (_homeViewModel.velocityFromSensors > 100) {
      return "Tehlikeli";
    } else if (_homeViewModel.velocityFromSensors > 20 &&
        _homeViewModel.velocityFromSensors < 80) {
      return "Normal";
    } else if (_homeViewModel.velocityFromSensors == 00) {
      return "Durağan";
    } else {
      return "Stabil";
    }
  }
}
