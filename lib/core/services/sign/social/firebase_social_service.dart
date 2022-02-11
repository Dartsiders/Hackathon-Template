import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackathontemplate/core/locator/locator.dart';
import 'package:hackathontemplate/core/services/sign/firebase_sign_service.dart';
import 'package:hackathontemplate/core/services/sign/social/social_service.dart';

import '../../../models/user_model/user_model.dart';

class FirebaseSocialService  implements SocialService{
  final FirebaseSignService _firebaseSignService =
      locator<FirebaseSignService>();

  Future<UserModel> signInWithGoogle() async {
    if (kIsWeb) {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      //googleProvider.addScope('https://www.googleapis.com/auth/user.phonenumbers.read');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      final UserModel _userModel =
          await _firebaseSignService.signInWithGoogleWeb(googleProvider);

      return _userModel;
    } else {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? _googleSignInAccount =
          await _googleSignIn.signIn();

      if (_googleSignInAccount != null) {
        final GoogleSignInAuthentication _googleSignInAuthentication =
            await _googleSignInAccount.authentication;

        if (_googleSignInAuthentication.idToken != null &&
            _googleSignInAuthentication.accessToken != null) {
          final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: _googleSignInAuthentication.accessToken,
            idToken: _googleSignInAuthentication.idToken,
          );

          //firebase gönderimi yapılıyor
          final UserModel _userModel =
              await _firebaseSignService.signInWithGoogle(authCredential);

          return _userModel;
        } else {
          return UserModel();
        }
      } else {
        return UserModel();
      }
    }
  }
}
