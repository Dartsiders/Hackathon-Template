// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthViewModel on _AuthViewModelBase, Store {
  final _$userModelAtom = Atom(name: '_AuthViewModelBase.userModel');

  @override
  UserModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$viewStateAtom = Atom(name: '_AuthViewModelBase.viewState');

  @override
  ViewState get viewState {
    _$viewStateAtom.reportRead();
    return super.viewState;
  }

  @override
  set viewState(ViewState value) {
    _$viewStateAtom.reportWrite(value, super.viewState, () {
      super.viewState = value;
    });
  }

  final _$signInWithGoogleAsyncAction =
      AsyncAction('_AuthViewModelBase.signInWithGoogle');

  @override
  Future<void> signInWithGoogle(BuildContext context) {
    return _$signInWithGoogleAsyncAction
        .run(() => super.signInWithGoogle(context));
  }

  final _$userModelSaveAndReadWithTestsAsyncAction =
      AsyncAction('_AuthViewModelBase.userModelSaveAndReadWithTests');

  @override
  Future<UserModel> userModelSaveAndReadWithTests(UserModel _userModel) {
    return _$userModelSaveAndReadWithTestsAsyncAction
        .run(() => super.userModelSaveAndReadWithTests(_userModel));
  }

  final _$readUserMethodAsyncAction =
      AsyncAction('_AuthViewModelBase.readUserMethod');

  @override
  Future<UserModel> readUserMethod(UserModel _userModel) {
    return _$readUserMethodAsyncAction
        .run(() => super.readUserMethod(_userModel));
  }

  final _$isUserSavedMethodAsyncAction =
      AsyncAction('_AuthViewModelBase.isUserSavedMethod');

  @override
  Future<bool> isUserSavedMethod(UserModel _userModel) {
    return _$isUserSavedMethodAsyncAction
        .run(() => super.isUserSavedMethod(_userModel));
  }

  final _$isUserAlreadyExistMethodAsyncAction =
      AsyncAction('_AuthViewModelBase.isUserAlreadyExistMethod');

  @override
  Future<bool> isUserAlreadyExistMethod(UserModel _userModel) {
    return _$isUserAlreadyExistMethodAsyncAction
        .run(() => super.isUserAlreadyExistMethod(_userModel));
  }

  final _$isUserModelEmptyMethodAsyncAction =
      AsyncAction('_AuthViewModelBase.isUserModelEmptyMethod');

  @override
  Future<bool> isUserModelEmptyMethod(UserModel _userModel) {
    return _$isUserModelEmptyMethodAsyncAction
        .run(() => super.isUserModelEmptyMethod(_userModel));
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
viewState: ${viewState}
    ''';
  }
}
