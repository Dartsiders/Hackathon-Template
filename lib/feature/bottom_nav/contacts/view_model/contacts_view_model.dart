import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackathontemplate/core/models/emergency_contact/emergency_contact_model.dart';
import 'package:hackathontemplate/core/models/user_model/user_model.dart';
import 'package:hackathontemplate/core/services/storage/firebase_storage_service.dart';
import 'package:hackathontemplate/feature/home/view_model/home_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../core/locator/locator.dart';
import '../../../../core/services/database/firebase_database_service.dart';
part 'contacts_view_model.g.dart';

class ContactsViewModel = _ContactsViewModelBase with _$ContactsViewModel;

abstract class _ContactsViewModelBase with Store {
  final FirebaseDatabaseService _firebaseDatabaseService =
      locator<FirebaseDatabaseService>();
  final FirebaseStorageService _firebaseStorageService =
      locator<FirebaseStorageService>();

  final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  @observable
  GlobalKey<FormState> addContactFormKey = GlobalKey<FormState>();

  @observable
  EmergencyContactModel emergencyContactModel = EmergencyContactModel();

  @observable
  RoundedLoadingButtonController addContactButtonController =
      RoundedLoadingButtonController();

  @observable
  File? imageFile;

  final ImagePicker _picker = ImagePicker();

  @action
  Future<void> pickContactProfilePicture(BuildContext context) async {
    await _picker
        .pickImage(
          source: ImageSource.camera,
        )
        .then(
          (xFile) => {
            if (xFile != null)
              {
                imageFile = File(xFile.path),
              }
          },
        );
  }

  @action
  Future<void> saveContactDatabase() async {
    try {
      if (imageFile != null) {
        emergencyContactModel.emergencyContactPhotoUrl =
            await _firebaseStorageService.contactProfilePictureSave(imageFile!);
      }

      await _firebaseDatabaseService.saveEmergencyContact(
        _homeViewModel.userModel!,
        emergencyContactModel,
      );
      print("emergency contact saved");
    } catch (e) {
      print(e);
    } finally {
      addContactButtonController.stop();
    }
  }

  @observable
  List<EmergencyContactModel> emergencyContactList = [];

  @action
  Future<void> getEmergencyContactList() async {
    try {
      emergencyContactList = await _firebaseDatabaseService.getEmergencyContact(
        _homeViewModel.userModel!,
      );
    } catch (e) {
      print(e);
    }
  }
}
