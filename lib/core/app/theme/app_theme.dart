import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import '../../../feature/init/view_model/init_view_model.dart';

import '../../locator/locator.dart';
import 'app_text_theme.dart';

class AppTheme {
  AppTheme._();

  final InitViewModel _initViewModel = locator<InitViewModel>();

  static ThemeData get themeDark => FlexThemeData.dark(
        scheme: FlexScheme.hippieBlue,
        textTheme: AppTextTheme.textTheme,
      );

  static ThemeData get themeLight => FlexThemeData.light(
        scheme: FlexScheme.hippieBlue,
        textTheme: AppTextTheme.textTheme,
      );

  static ThemeData get theme =>
      AppTheme._()._initViewModel.isDarkModel ? themeDark : themeLight;

  static TextTheme get textStyle => theme.textTheme;
}
