import 'package:hackathontemplate/core/models/user_model/user_model.dart';

abstract class DatabaseService {
  Future<String?> getUser(UserModel userModel);
}
