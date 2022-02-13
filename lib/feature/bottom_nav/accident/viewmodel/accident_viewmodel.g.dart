// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accident_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccidentViewModel on _AccidentViewModelBase, Store {
  final _$imageFileAtom = Atom(name: '_AccidentViewModelBase.imageFile');

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$reportDescriptionAtom =
      Atom(name: '_AccidentViewModelBase.reportDescription');

  @override
  String? get reportDescription {
    _$reportDescriptionAtom.reportRead();
    return super.reportDescription;
  }

  @override
  set reportDescription(String? value) {
    _$reportDescriptionAtom.reportWrite(value, super.reportDescription, () {
      super.reportDescription = value;
    });
  }

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

  final _$reportDateAtom = Atom(name: '_AccidentViewModelBase.reportDate');

  @override
  String? get reportDate {
    _$reportDateAtom.reportRead();
    return super.reportDate;
  }

  @override
  set reportDate(String? value) {
    _$reportDateAtom.reportWrite(value, super.reportDate, () {
      super.reportDate = value;
    });
  }

  final _$setProfileImageAsyncAction =
      AsyncAction('_AccidentViewModelBase.setProfileImage');

  @override
  Future<void> setProfileImage() {
    return _$setProfileImageAsyncAction.run(() => super.setProfileImage());
  }

  final _$reportEmergencyAsyncAction =
      AsyncAction('_AccidentViewModelBase.reportEmergency');

  @override
  Future<void> reportEmergency() {
    return _$reportEmergencyAsyncAction.run(() => super.reportEmergency());
  }

  final _$updateEmergencyAsyncAction =
      AsyncAction('_AccidentViewModelBase.updateEmergency');

  @override
  Future<void> updateEmergency(String? fire, String? peopleCount,
      String? consciousness, String? bleeding) {
    return _$updateEmergencyAsyncAction.run(
      () => super.updateEmergency(fire, peopleCount, consciousness, bleeding),
    );
  }

  @override
  String toString() {
    return '''
imageFile: ${imageFile},
reportDescription: ${reportDescription},
currentLocation: ${currentLocation},
reportDate: ${reportDate}
    ''';
  }
}
