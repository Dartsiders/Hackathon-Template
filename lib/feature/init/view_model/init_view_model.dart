import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobx/mobx.dart';

import '../../../core/app/theme/app_theme.dart';
import '../../../core/enum/view_state_enum.dart';
import '../../../core/locator/locator.dart';
import '../../../core/services/database/firebase_database_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'init_view_model.g.dart';

class InitViewModel = _InitViewModelBase with _$InitViewModel;

abstract class _InitViewModelBase with Store {

   final FirebaseDatabaseService _firebaseDatabaseService =
      locator<FirebaseDatabaseService>();


  @observable
  bool isDarkModel = SchedulerBinding.instance!.window.platformBrightness ==
        Brightness.dark;

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
  
}
