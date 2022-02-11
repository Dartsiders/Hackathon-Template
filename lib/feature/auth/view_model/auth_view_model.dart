import 'package:flutter/material.dart';
import 'package:hackathontemplate/core/services/database/firebase_database_service.dart';
import 'package:hackathontemplate/core/services/sign/firebase_sign_service.dart';
import 'package:hackathontemplate/core/services/sign/social/firebase_social_service.dart';
import 'package:mobx/mobx.dart';

import '../../../core/enum/view_state_enum.dart';
import '../../../core/locator/locator.dart';
import '../../../core/models/user_model/user_model.dart';

part 'auth_view_model.g.dart';

class AuthViewModel = _AuthViewModelBase with _$AuthViewModel;

abstract class _AuthViewModelBase with Store {
  final FirebaseDatabaseService _firebaseDatabaseService =
      locator<FirebaseDatabaseService>();

  final FirebaseSignService _firebaseSignService =
      locator<FirebaseSignService>();

  final FirebaseSocialService _firebaseSocialService =
      locator<FirebaseSocialService>();

  @observable
  UserModel userModel = UserModel();

  @observable
  ViewState viewState = ViewState.idle;

  //@observable
  //bool isUserAlreadyCreated = false;

  @action
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      viewState = ViewState.busy;

      userModel = await _firebaseSocialService.signInWithGoogle();
      await userModelSaveAndReadWithTests(userModel);

      if (userModel.userId != null) {
        Navigator.of(context).pushNamed("/home");
      }

      // if (!isUserAlreadyCreated) {
      // Navigator.of(context).push(personalInformationRoute);
      // } else {
      //  Navigator.of(context).pushNamed("/home");
      //}
    } catch (e) {
      print("UserAuthenticationViewModel signInWithGoogle hata yakaladı $e");
    } finally {
      viewState = ViewState.idle;
    }
  }

  @action
  Future<UserModel> userModelSaveAndReadWithTests(UserModel _userModel) async {
    try {
      if (!await isUserModelEmptyMethod(_userModel)) {
        //userModel boş değilse
        if (!await isUserAlreadyExistMethod(_userModel)) {
          //isUserAlreadyCreated = false;
          //userModel database de yok ise
          if (await isUserSavedMethod(_userModel)) {
            //userModel kaydedilmiş ise
            return await readUserMethod(_userModel);
          } else {
            return UserModel();
          }
        } else {
          //isUserAlreadyCreated = true;
          return await readUserMethod(_userModel);
        }
      } else {
        return UserModel();
      }
    } catch (e) {
      print(
          "UserAuthenticationViewModel userModelSaveAndReadWithTests hata yakaladı $e");
      return UserModel();
    }
  }

  @action
  Future<UserModel> readUserMethod(UserModel _userModel) async {
    try {
      userModel =
          await _firebaseDatabaseService.userReadDatabase(_userModel.userId);
      //_mainViewModel.userModel = userModel;
      return userModel;
    } catch (e) {
      print("UserAuthenticationViewModel readUserMethod hata yakaladı $e");
      return UserModel();
    }
  }

  @action
  Future<bool> isUserSavedMethod(UserModel _userModel) async {
    try {
      return await _firebaseDatabaseService.userSaveDatabase(_userModel);
    } catch (e) {
      print("UserAuthenticationViewModel isUserSavedMethod hata yakaladı $e");
      return false;
    }
  }

  @action
  Future<bool> isUserAlreadyExistMethod(UserModel _userModel) async {
    try {
      return await _firebaseDatabaseService
          .userControlDatabase(_userModel.userId);
    } catch (e) {
      print(
          "UserAuthenticationViewModel isUserAlreadyExistMethod hata yakaladı $e");
      return false;
    }
  }

  @action
  Future<bool> isUserModelEmptyMethod(UserModel _userModel) async {
    if (_userModel.userId!.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
