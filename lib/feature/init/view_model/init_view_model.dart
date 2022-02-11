import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

import '../../../core/app/theme/app_theme.dart';
import '../../../core/enum/view_state_enum.dart';
import '../../../core/locator/locator.dart';
import '../../../core/services/database/firebase_database_service.dart';

part 'init_view_model.g.dart';

class InitViewModel = _InitViewModelBase with _$InitViewModel;

abstract class _InitViewModelBase with Store {
  final FirebaseDatabaseService _firebaseDatabaseService =
      locator<FirebaseDatabaseService>();

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
  Future<void /*Position*/ > setLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      isLocationEnabled = false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        isLocationEnabled = false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      isLocationEnabled = false;
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      isLocationEnabled = true;
    }
  }
}
