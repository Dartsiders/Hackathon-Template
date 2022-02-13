// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationViewModel on _NotificationViewModelBase, Store {
  final _$autoEmergencyListAtom =
      Atom(name: '_NotificationViewModelBase.autoEmergencyList');

  @override
  List<AutoEmergencyModel> get autoEmergencyList {
    _$autoEmergencyListAtom.reportRead();
    return super.autoEmergencyList;
  }

  @override
  set autoEmergencyList(List<AutoEmergencyModel> value) {
    _$autoEmergencyListAtom.reportWrite(value, super.autoEmergencyList, () {
      super.autoEmergencyList = value;
    });
  }

  final _$getAutoEmergencyListAsyncAction =
      AsyncAction('_NotificationViewModelBase.getAutoEmergencyList');

  @override
  Future<void> getAutoEmergencyList() {
    return _$getAutoEmergencyListAsyncAction
        .run(() => super.getAutoEmergencyList());
  }

  @override
  String toString() {
    return '''
autoEmergencyList: ${autoEmergencyList}
    ''';
  }
}
