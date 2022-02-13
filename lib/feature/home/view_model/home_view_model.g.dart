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

  final _$velocityFromSensorsAtom =
      Atom(name: '_HomeViewModelBase.velocityFromSensors');

  @override
  int get velocityFromSensors {
    _$velocityFromSensorsAtom.reportRead();
    return super.velocityFromSensors;
  }

  @override
  set velocityFromSensors(int value) {
    _$velocityFromSensorsAtom.reportWrite(value, super.velocityFromSensors, () {
      super.velocityFromSensors = value;
    });
  }

  final _$velocityListAtom = Atom(name: '_HomeViewModelBase.velocityList');

  @override
  ObservableList<int?>? get velocityList {
    _$velocityListAtom.reportRead();
    return super.velocityList;
  }

  @override
  set velocityList(ObservableList<int?>? value) {
    _$velocityListAtom.reportWrite(value, super.velocityList, () {
      super.velocityList = value;
    });
  }

  final _$isStatusEmergencyAtom =
      Atom(name: '_HomeViewModelBase.isStatusEmergency');

  @override
  bool get isStatusEmergency {
    _$isStatusEmergencyAtom.reportRead();
    return super.isStatusEmergency;
  }

  @override
  set isStatusEmergency(bool value) {
    _$isStatusEmergencyAtom.reportWrite(value, super.isStatusEmergency, () {
      super.isStatusEmergency = value;
    });
  }

  final _$autoEmergencyModelAtom =
      Atom(name: '_HomeViewModelBase.autoEmergencyModel');

  @override
  AutoEmergencyModel? get autoEmergencyModel {
    _$autoEmergencyModelAtom.reportRead();
    return super.autoEmergencyModel;
  }

  @override
  set autoEmergencyModel(AutoEmergencyModel? value) {
    _$autoEmergencyModelAtom.reportWrite(value, super.autoEmergencyModel, () {
      super.autoEmergencyModel = value;
    });
  }

  final _$getCurrentPositionFromGPSAsyncAction =
      AsyncAction('_HomeViewModelBase.getCurrentPositionFromGPS');

  @override
  Future getCurrentPositionFromGPS() {
    return _$getCurrentPositionFromGPSAsyncAction
        .run(() => super.getCurrentPositionFromGPS());
  }

  final _$saveAutoEmergencyAsyncAction =
      AsyncAction('_HomeViewModelBase.saveAutoEmergency');

  @override
  Future<void> saveAutoEmergency() {
    return _$saveAutoEmergencyAsyncAction.run(() => super.saveAutoEmergency());
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  dynamic listenVelocityFromSensors() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.listenVelocityFromSensors');
    try {
      return super.listenVelocityFromSensors();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
viewState: ${viewState},
userModel: ${userModel},
homeTabController: ${homeTabController},
isTabHide: ${isTabHide},
velocityFromSensors: ${velocityFromSensors},
velocityList: ${velocityList},
isStatusEmergency: ${isStatusEmergency},
autoEmergencyModel: ${autoEmergencyModel}
    ''';
  }
}
