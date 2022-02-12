import 'dart:io';

import '../../models/emergency/emergency_model.dart';

abstract class StorageService {
  Future<String> emergencyPictureSaveStorage(
    EmergencyModel emergencyModel,
    File profilePicture,
  );
  Future<String> contactProfilePictureSave(
    File profilePicture,
  );
}
