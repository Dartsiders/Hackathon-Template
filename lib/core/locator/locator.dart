import 'package:get_it/get_it.dart';
import 'package:hackathontemplate/core/services/sign/firebase_sign_service.dart';
import 'package:hackathontemplate/core/services/sign/social/firebase_social_service.dart';
import 'package:hackathontemplate/feature/auth/view_model/auth_view_model.dart';
import '../services/database/firebase_database_service.dart';
import '../../feature/init/view_model/init_view_model.dart';

import '../../feature/home/view_model/home_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => InitViewModel());
  locator.registerLazySingleton(() => AuthViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => FirebaseDatabaseService());
  locator.registerLazySingleton(() => FirebaseSocialService());
  locator.registerLazySingleton(() => FirebaseSignService());
}
