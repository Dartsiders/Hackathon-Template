import '../../../models/user_model/user_model.dart';

abstract class SocialService {
  Future<UserModel> signInWithGoogle();
}
