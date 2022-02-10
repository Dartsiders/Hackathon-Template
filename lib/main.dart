import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'feature/init/view_model/init_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/locator/locator.dart';
import 'core/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final InitViewModel _initViewModel = locator<InitViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _initViewModel.locale,
        theme: _initViewModel.appTheme,
        debugShowCheckedModeBanner: false,
        title: "Hackathon Template",
        initialRoute: Routes.home,
        routes: Routes.routes,
      );
    });
  }
}

///bu bir deneme yorumudur.
