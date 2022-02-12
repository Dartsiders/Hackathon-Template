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

  final _$addContactButtonControllerAtom =
      Atom(name: '_ContactsViewModelBase.addContactButtonController');

  @override
  RoundedLoadingButtonController get addContactButtonController {
    _$addContactButtonControllerAtom.reportRead();
    return super.addContactButtonController;
  }

  @override
  set addContactButtonController(RoundedLoadingButtonController value) {
    _$addContactButtonControllerAtom
        .reportWrite(value, super.addContactButtonController, () {
      super.addContactButtonController = value;
    });
  }

  final _$imageFileAtom = Atom(name: '_ContactsViewModelBase.imageFile');

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

  final _$emergencyContactListAtom =
      Atom(name: '_ContactsViewModelBase.emergencyContactList');

  @override
  List<EmergencyContactModel> get emergencyContactList {
    _$emergencyContactListAtom.reportRead();
    return super.emergencyContactList;
  }

  @override
  set emergencyContactList(List<EmergencyContactModel> value) {
    _$emergencyContactListAtom.reportWrite(value, super.emergencyContactList,
        () {
      super.emergencyContactList = value;
    });
  }

  final _$pickContactProfilePictureAsyncAction =
      AsyncAction('_ContactsViewModelBase.pickContactProfilePicture');

  @override
  Future<void> pickContactProfilePicture(BuildContext context) {
    return _$pickContactProfilePictureAsyncAction
        .run(() => super.pickContactProfilePicture(context));
  }

  final _$saveContactDatabaseAsyncAction =
      AsyncAction('_ContactsViewModelBase.saveContactDatabase');

  @override
  Future<void> saveContactDatabase() {
    return _$saveContactDatabaseAsyncAction
        .run(() => super.saveContactDatabase());
  }

  final _$getEmergencyContactListAsyncAction =
      AsyncAction('_ContactsViewModelBase.getEmergencyContactList');

  @override
  Future<void> getEmergencyContactList() {
    return _$getEmergencyContactListAsyncAction
        .run(() => super.getEmergencyContactList());
  }

  @override
  String toString() {
    return '''
addContactFormKey: ${addContactFormKey},
emergencyContactModel: ${emergencyContactModel},
addContactButtonController: ${addContactButtonController},
imageFile: ${imageFile},
emergencyContactList: ${emergencyContactList}
    ''';
  }
}
