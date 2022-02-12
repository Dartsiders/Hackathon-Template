import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/locator/locator.dart';
import 'core/routes/routes.dart';
import 'feature/init/view_model/init_view_model.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return ScreenUtilInit(
      designSize: const Size(412, 798),
      builder: () => Observer(
        builder: (a) => MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _initViewModel.locale,
          theme: _initViewModel.appTheme,
          themeMode:
              _initViewModel.isDarkModel ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          title: "Hackathon Template",
          initialRoute: Routes.accident,
          routes: Routes.routes,
        ),
      ),
    );
  }
}


///bu bir deneme yorumudur.
