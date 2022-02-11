import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_model/user_model.dart';

abstract class SignService {
  Future<UserModel> signInWithGoogle(AuthCredential authCredential);
  Future<UserModel> signInWithGoogleWeb(GoogleAuthProvider googleAuthProvider);
}
