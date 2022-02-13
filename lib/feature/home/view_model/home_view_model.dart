import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:group_button/group_button.dart';
import 'package:hackathontemplate/core/models/emergency/emergency_model.dart';
import 'package:hackathontemplate/core/models/user_model/user_model.dart';
import 'package:hackathontemplate/core/services/location/location_service.dart';
import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../core/enum/view_state_enum.dart';
import '../../../core/locator/locator.dart';
import '../../../core/models/auto_emergency/auto_emergency_model.dart';
import '../../../core/services/database/firebase_database_service.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final FirebaseDatabaseService _firebaseDatabaseService =
      locator<FirebaseDatabaseService>();

  final LocationService _locationService = locator<LocationService>();

  @observable
  ViewState viewState = ViewState.idle;

  @observable
  UserModel? userModel = UserModel();

  @observable
  PersistentTabController homeTabController = PersistentTabController();

  @observable
  bool? isTabHide = false;

  @observable
  int velocityFromSensors = 0;

  @observable
  ObservableList<int?>? velocityList = ObservableList<int?>.of([]);

  @observable
  bool isStatusEmergency = false;

  @action
  listenVelocityFromSensors() {
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      double newVelocity =
          sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
      if ((newVelocity - velocityFromSensors).abs() > 1) {
        velocityFromSensors = newVelocity.toInt();
        velocityList?.add(velocityFromSensors);
        if (velocityList?.length == 10) {
          velocityList?.removeAt(0);
        }
        if (velocityList != null) {
          if (velocityList!.length > 3) {
            print("last: " + velocityList!.last!.toString());
            print("last - 1: " +
                velocityList![velocityList!.length - 2]!.toInt().toString());
            int aradakiFark = velocityList!.last! -
                velocityList![velocityList!.length - 2]!.toInt();
            if (aradakiFark > 60) {
              isStatusEmergency = true;
            }
          }
        }
      }
    });
  }

  @observable
  AutoEmergencyModel? autoEmergencyModel = AutoEmergencyModel();

  @action
  getCurrentPositionFromGPS() async {
    _locationService.getCurrentPosition().then((position) {
      autoEmergencyModel?.autoEmergencyLocationLatitude =
          position.latitude.toStringAsFixed(1);
      autoEmergencyModel?.autoEmergencyLocationLongitude =
          position.longitude.toStringAsFixed(1);
    });
  }

  @action
  Future<void> saveAutoEmergency() async {
    try {
      viewState = ViewState.busy;

      autoEmergencyModel?.autoEmergencyUserId = userModel?.userId;
      autoEmergencyModel?.autoEmergencyUserName = userModel?.userName;
      autoEmergencyModel?.autoEmergencyStatus = "active";
      await _firebaseDatabaseService.saveAutoEmergency(
        userModel!,
        autoEmergencyModel!,
      );
    } catch (e) {
      print(e);
    } finally {
      viewState = ViewState.idle;
    }
  }
}
