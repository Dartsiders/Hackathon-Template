// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$viewStateAtom = Atom(name: '_HomeViewModelBase.viewState');

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

  final _$userModelAtom = Atom(name: '_HomeViewModelBase.userModel');

  @override
  UserModel? get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel? value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$homeTabControllerAtom =
      Atom(name: '_HomeViewModelBase.homeTabController');

  @override
  PersistentTabController get homeTabController {
    _$homeTabControllerAtom.reportRead();
    return super.homeTabController;
  }

  @override
  set homeTabController(PersistentTabController value) {
    _$homeTabControllerAtom.reportWrite(value, super.homeTabController, () {
      super.homeTabController = value;
    });
  }

  final _$isTabHideAtom = Atom(name: '_HomeViewModelBase.isTabHide');

  @override
  bool? get isTabHide {
    _$isTabHideAtom.reportRead();
    return super.isTabHide;
  }

  @override
  set isTabHide(bool? value) {
    _$isTabHideAtom.reportWrite(value, super.isTabHide, () {
      super.isTabHide = value;
    });
  }

  @override
  String toString() {
    return '''
viewState: ${viewState},
userModel: ${userModel},
homeTabController: ${homeTabController},
isTabHide: ${isTabHide}
    ''';
  }
}
