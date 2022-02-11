


import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathontemplate/core/services/sign/sign_service.dart';

import '../../models/user_model/user_model.dart';

class FirebaseSignService implements SignService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserModel _userFromFirebase(User? _currentUser) {
    //if (kullanici == null) return null;
    final userModel = UserModel(
      userId: _currentUser!.uid,
      userName: _currentUser.displayName,
      userEmail: _currentUser.email,
      userPhotoUrl: _currentUser.photoURL,
    );
    return userModel;
  }

  String? uId;

  @override
  Future<bool> currentUser() async {
    final User? _currentUser = _firebaseAuth.currentUser;
    if (_currentUser!.uid.isNotEmpty) {
      uId = _currentUser.uid;
      return true;
    } else {
      print("usermodel boş");
      return false;
    }
  }

  @override
  Future<UserModel> signInWithGoogle(AuthCredential authCredential) async {
    final UserCredential _userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);
    return _userFromFirebase(_userCredential.user);
  }

  @override
  Future<UserModel> signInWithGoogleWeb(
    GoogleAuthProvider googleProvider,
  ) async {
    final UserCredential _userCredential =
        await _firebaseAuth.signInWithPopup(googleProvider);
    return _userFromFirebase(_userCredential.user);
  }

  
}
