import 'package:flutter/material.dart';
import 'package:hackathontemplate/core/models/auto_emergency/auto_emergency_model.dart';
import 'package:mobx/mobx.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../core/locator/locator.dart';
import '../../../core/models/emergency_contact/emergency_contact_model.dart';
import '../../../core/services/database/firebase_database_service.dart';
import '../../home/view_model/home_view_model.dart';
part 'notification_view_model.g.dart';

class NotificationViewModel = _NotificationViewModelBase
    with _$NotificationViewModel;

abstract class _NotificationViewModelBase with Store {
  final FirebaseDatabaseService _firebaseDatabaseService =
      locator<FirebaseDatabaseService>();

  final HomeViewModel _homeViewModel = locator<HomeViewModel>();


  @observable
  List<AutoEmergencyModel> autoEmergencyList = [];

  @action
  Future<void> getAutoEmergencyList() async {
    try {
      autoEmergencyList = await _firebaseDatabaseService.getUserEmergency(
        _homeViewModel.userModel!,
      );
    } catch (e) {
      print(e);
    }
  }
}
