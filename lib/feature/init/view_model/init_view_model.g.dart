// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InitViewModel on _InitViewModelBase, Store {
  Computed<ThemeData>? _$appThemeComputed;

  @override
  ThemeData get appTheme =>
      (_$appThemeComputed ??= Computed<ThemeData>(() => super.appTheme,
              name: '_InitViewModelBase.appTheme'))
          .value;
  Computed<Locale>? _$localeComputed;

  @override
  Locale get locale =>
      (_$localeComputed ??= Computed<Locale>(() => super.locale,
              name: '_InitViewModelBase.locale'))
          .value;

  final _$isLocationEnabledAtom =
      Atom(name: '_InitViewModelBase.isLocationEnabled');

  @override
  bool? get isLocationEnabled {
    _$isLocationEnabledAtom.reportRead();
    return super.isLocationEnabled;
  }

  @override
  set isLocationEnabled(bool? value) {
    _$isLocationEnabledAtom.reportWrite(value, super.isLocationEnabled, () {
      super.isLocationEnabled = value;
    });
  }

  final _$isDarkModelAtom = Atom(name: '_InitViewModelBase.isDarkModel');

  @override
  bool get isDarkModel {
    _$isDarkModelAtom.reportRead();
    return super.isDarkModel;
  }

  @override
  set isDarkModel(bool value) {
    _$isDarkModelAtom.reportWrite(value, super.isDarkModel, () {
      super.isDarkModel = value;
    });
  }

  final _$isENLocalAtom = Atom(name: '_InitViewModelBase.isENLocal');

  @override
  bool get isENLocal {
    _$isENLocalAtom.reportRead();
    return super.isENLocal;
  }

  @override
  set isENLocal(bool value) {
    _$isENLocalAtom.reportWrite(value, super.isENLocal, () {
      super.isENLocal = value;
    });
  }

  final _$viewStateAtom = Atom(name: '_InitViewModelBase.viewState');

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

  final _$userModelAtom = Atom(name: '_InitViewModelBase.userModel');

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

  final _$setLocationPermissionAsyncAction =
      AsyncAction('_InitViewModelBase.setLocationPermission');

  @override
  Future<void> setLocationPermission() {
    return _$setLocationPermissionAsyncAction
        .run(() => super.setLocationPermission());
  }

  final _$currentUserAsyncAction =
      AsyncAction('_InitViewModelBase.currentUser');

  @override
  Future<bool> currentUser() {
    return _$currentUserAsyncAction.run(() => super.currentUser());
  }

  @override
  String toString() {
    return '''
isLocationEnabled: ${isLocationEnabled},
isDarkModel: ${isDarkModel},
isENLocal: ${isENLocal},
viewState: ${viewState},
userModel: ${userModel},
appTheme: ${appTheme},
locale: ${locale}
    ''';
  }
}
