import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackathontemplate/core/services/database/firebase_database_service.dart';
import 'package:hackathontemplate/core/services/sign/firebase_sign_service.dart';
import 'package:hackathontemplate/core/services/sign/social/firebase_social_service.dart';
import 'package:mobx/mobx.dart';

import '../../../core/enum/view_state_enum.dart';
import '../../../core/locator/locator.dart';
import '../../../core/models/user_model/user_model.dart';
import '../../home/view_model/home_view_model.dart';

part 'auth_view_model.g.dart';

class AuthViewModel = _AuthViewModelBase with _$AuthViewModel;

abstract class _AuthViewModelBase with Store {
  final FirebaseDatabaseService _firebaseDatabaseService =
      locator<FirebaseDatabaseService>();

  final FirebaseSocialService _firebaseSocialService =
      locator<FirebaseSocialService>();

  final FirebaseSignService _firebaseSignService =
      locator<FirebaseSignService>();

  final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  @observable
  UserModel userModel = UserModel();

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? name;

  @observable
  bool isPasswordVisible = false;

  @observable
  ViewState viewState = ViewState.idle;

  //@observable
  //bool isUserAlreadyCreated = false;

  @action
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  Future createAccount(BuildContext context) async {
    final bool valid = await _firebaseSignService.uniqUserCheck(email!);
    if (!valid) {
      Fluttertoast.showToast(msg: "Mail Adresi Sistemde Kayıtlı");
    } else {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);

        final document =
            FirebaseFirestore.instance.collection("users").doc(email);
        await document.set({
          "id": document.id,
          "name": name,
          "email": email,
          "password": password,
        }).then((value) => Navigator.pushNamed(context, "/verification"));
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(
          msg: error.message ?? "Hatalı Giriş Denemesi",
          gravity: ToastGravity.CENTER,
          textColor: Colors.red,
        );
      }
    }
  }

  @action
  void onEmailChanged(String value) {
    email = value;
  }

  @action
  void onNameChanged(String value) {
    name = value;
  }

  @action
  void onPassChange(String value) {
    password = value;
  }

  @action
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      viewState = ViewState.busy;

      userModel = await _firebaseSocialService.signInWithGoogle();
      await userModelSaveAndReadWithTests(userModel);

      if (userModel.userId != null) {
        _homeViewModel.userModel = userModel;
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
  Future authentication(
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email!, password: password!);
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/home",
          (route) => false,
        );
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(
          msg: error.message ?? "Hatalı Giriş Denemesi",
          gravity: ToastGravity.CENTER,
          textColor: Colors.red,
        );
      }
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
        "UserAuthenticationViewModel userModelSaveAndReadWithTests hata yakaladı $e",
      );
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
        "UserAuthenticationViewModel isUserAlreadyExistMethod hata yakaladı $e",
      );
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
