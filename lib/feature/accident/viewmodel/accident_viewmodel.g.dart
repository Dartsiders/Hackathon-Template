// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accident_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccidentViewModel on _AccidentViewModelBase, Store {
  final _$currentLocationAtom =
      Atom(name: '_AccidentViewModelBase.currentLocation');

  @override
  Position? get currentLocation {
    _$currentLocationAtom.reportRead();
    return super.currentLocation;
  }

  @override
  set currentLocation(Position? value) {
    _$currentLocationAtom.reportWrite(value, super.currentLocation, () {
      super.currentLocation = value;
    });
  }

  final _$_AccidentViewModelBaseActionController =
      ActionController(name: '_AccidentViewModelBase');

  @override
  void setCurrentLocation() {
    final _$actionInfo = _$_AccidentViewModelBaseActionController.startAction(
        name: '_AccidentViewModelBase.setCurrentLocation');
    try {
      return super.setCurrentLocation();
    } finally {
      _$_AccidentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentLocation: ${currentLocation}
    ''';
  }
}
