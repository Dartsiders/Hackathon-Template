import 'package:get_it/get_it.dart';
import 'package:hackathontemplate/core/services/location/location_service.dart';
import 'package:hackathontemplate/core/services/sign/firebase_sign_service.dart';
import 'package:hackathontemplate/core/services/sign/social/firebase_social_service.dart';
import 'package:hackathontemplate/core/services/storage/firebase_storage_service.dart';
import 'package:hackathontemplate/feature/auth/view_model/auth_view_model.dart';
import 'package:hackathontemplate/feature/bottom_nav/contacts/view_model/contacts_view_model.dart';
import 'package:hackathontemplate/feature/bottom_nav/main/view_model/main_view_model.dart';
import 'package:hackathontemplate/feature/bottom_nav/settings/view_model/settings_view_model.dart';

import '../../feature/bottom_nav/accident/viewmodel/accident_viewmodel.dart';
import '../../feature/home/view_model/home_view_model.dart';
import '../../feature/init/view_model/init_view_model.dart';
import '../services/database/firebase_database_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => InitViewModel());
  locator.registerLazySingleton(() => AuthViewModel());

  locator.registerLazySingleton(() => HomeViewModel());

  locator.registerLazySingleton(() => MainViewModel());
  locator.registerLazySingleton(() => AccidentViewModel());
  locator.registerLazySingleton(() => ContactsViewModel());
  locator.registerLazySingleton(() => SettingsViewModel());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => FirebaseDatabaseService());
  locator.registerLazySingleton(() => FirebaseSocialService());
  locator.registerLazySingleton(() => FirebaseSignService());
  locator.registerLazySingleton(() => FirebaseStorageService());
}
