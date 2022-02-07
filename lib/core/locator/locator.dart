import 'package:get_it/get_it.dart';
import 'package:hackathontemplate/core/services/database/firebase_database_service.dart';
import 'package:hackathontemplate/feature/init/view_model/init_view_model.dart';

import '../../feature/home/view_model/home_view_model.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => InitViewModel());
  locator.registerLazySingleton(() => HomeViewModel());

  locator.registerLazySingleton(() => FirebaseDatabaseService());
}
