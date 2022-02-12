// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactsViewModel on _ContactsViewModelBase, Store {
  final _$addContactFormKeyAtom =
      Atom(name: '_ContactsViewModelBase.addContactFormKey');

  @override
  GlobalKey<FormState> get addContactFormKey {
    _$addContactFormKeyAtom.reportRead();
    return super.addContactFormKey;
  }

  @override
  set addContactFormKey(GlobalKey<FormState> value) {
    _$addContactFormKeyAtom.reportWrite(value, super.addContactFormKey, () {
      super.addContactFormKey = value;
    });
  }

  final _$emergencyContactModelAtom =
      Atom(name: '_ContactsViewModelBase.emergencyContactModel');

  @override
  EmergencyContactModel get emergencyContactModel {
    _$emergencyContactModelAtom.reportRead();
    return super.emergencyContactModel;
  }

  @override
  set emergencyContactModel(EmergencyContactModel value) {
    _$emergencyContactModelAtom.reportWrite(value, super.emergencyContactModel,
        () {
      super.emergencyContactModel = value;
    });
  }

  @override
  String toString() {
    return '''
addContactFormKey: ${addContactFormKey},
emergencyContactModel: ${emergencyContactModel}
    ''';
  }
}
