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

  final _$emailAtom = Atom(name: '_AuthViewModelBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthViewModelBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$nameAtom = Atom(name: '_AuthViewModelBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$isPasswordVisibleAtom =
      Atom(name: '_AuthViewModelBase.isPasswordVisible');

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
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

  final _$createAccountAsyncAction =
      AsyncAction('_AuthViewModelBase.createAccount');

  @override
  Future<dynamic> createAccount(BuildContext context) {
    return _$createAccountAsyncAction.run(() => super.createAccount(context));
  }

  final _$signInWithGoogleAsyncAction =
      AsyncAction('_AuthViewModelBase.signInWithGoogle');

  @override
  Future<void> signInWithGoogle(BuildContext context) {
    return _$signInWithGoogleAsyncAction
        .run(() => super.signInWithGoogle(context));
  }

  final _$authenticationAsyncAction =
      AsyncAction('_AuthViewModelBase.authentication');

  @override
  Future<dynamic> authentication(
      BuildContext context, GlobalKey<FormState> formKey) {
    return _$authenticationAsyncAction
        .run(() => super.authentication(context, formKey));
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

  final _$_AuthViewModelBaseActionController =
      ActionController(name: '_AuthViewModelBase');

  @override
  void changePasswordVisibility() {
    final _$actionInfo = _$_AuthViewModelBaseActionController.startAction(
      name: '_AuthViewModelBase.changePasswordVisibility',
    );
    try {
      return super.changePasswordVisibility();
    } finally {
      _$_AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onEmailChanged(String value) {
    final _$actionInfo = _$_AuthViewModelBaseActionController.startAction(
      name: '_AuthViewModelBase.onEmailChanged',
    );
    try {
      return super.onEmailChanged(value);
    } finally {
      _$_AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onNameChanged(String value) {
    final _$actionInfo = _$_AuthViewModelBaseActionController.startAction(
      name: '_AuthViewModelBase.onNameChanged',
    );
    try {
      return super.onNameChanged(value);
    } finally {
      _$_AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPassChange(String value) {
    final _$actionInfo = _$_AuthViewModelBaseActionController.startAction(
      name: '_AuthViewModelBase.onPassChange',
    );
    try {
      return super.onPassChange(value);
    } finally {
      _$_AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
email: ${email},
password: ${password},
name: ${name},
isPasswordVisible: ${isPasswordVisible},
viewState: ${viewState}
    ''';
  }
}
