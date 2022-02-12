import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hackathontemplate/core/models/emergency/emergency_model.dart';
import 'package:hackathontemplate/core/services/storage/storage_service.dart';

class FirebaseStorageService implements StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  @override
  Future<String> emergencyPictureSaveStorage(
    EmergencyModel emergencyModel,
    File profilePicture,
  ) async {
    String downloadUrl = "";

    final storageReference = _firebaseStorage
        .ref(emergencyModel.emergencyId)
        .child(profilePicture.path.split("/").last);

    await storageReference.putFile(profilePicture).then((value) async {
      downloadUrl = await value.ref.getDownloadURL();
    });
    return downloadUrl;
  }
}
