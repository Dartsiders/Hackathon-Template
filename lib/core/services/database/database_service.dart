import '../../models/user_model/user_model.dart';

abstract class DatabaseService {
  Future<bool> userSaveDatabase(UserModel userModel);
  Future<UserModel> userReadDatabase(String? userId);
  Future<bool> userControlDatabase(String? userId);


}
