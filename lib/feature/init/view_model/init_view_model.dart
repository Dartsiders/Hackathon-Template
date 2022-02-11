import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

import '../../../core/app/theme/app_theme.dart';
import '../../../core/enum/view_state_enum.dart';
import '../../../core/locator/locator.dart';
import '../../../core/models/user_model/user_model.dart';
import '../../../core/services/database/firebase_database_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/services/sign/firebase_sign_service.dart';

part 'init_view_model.g.dart';

class InitViewModel = _InitViewModelBase with _$InitViewModel;

abstract class _InitViewModelBase with Store {
  final FirebaseDatabaseService _firebaseDatabaseService =
      locator<FirebaseDatabaseService>();

  final FirebaseSignService _firebaseSignService =
      locator<FirebaseSignService>();

  @observable
  bool? isLocationEnabled;

  @observable
  bool isDarkModel =
      SchedulerBinding.instance!.window.platformBrightness == Brightness.dark;

  @computed
  ThemeData get appTheme => AppTheme.theme;

  @observable
  bool isENLocal = false;

  @computed
  Locale get locale => isENLocal
      ? AppLocalizations.supportedLocales.first
      : AppLocalizations.supportedLocales.last;

  @observable
  ViewState viewState = ViewState.idle;

  @action
  Future<void> setLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      isLocationEnabled = false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        isLocationEnabled = false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      isLocationEnabled = false;
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      isLocationEnabled = true;
    }
  }

  @observable
  UserModel userModel = UserModel();

  @action
  Future<bool> currentUser() async {
    try {
      bool isUserExist = await _firebaseSignService.currentUser();
      String? uId = _firebaseSignService.uId;
      if (isUserExist) {
        userModel =
            await _firebaseDatabaseService.userReadDatabase(uId);
        //_mainViewModel.userModel = userModel;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("UserAuthenticationViewModel currentUser hata yakaladı $e");
      return false;
    }
  }
}
