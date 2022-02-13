import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathontemplate/core/locator/locator.dart';
import 'package:hackathontemplate/core/services/location/location_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/models/emergency/emergency_model.dart';
import '../../../../core/services/database/firebase_database_service.dart';

part 'accident_viewmodel.g.dart';

class AccidentViewModel = _AccidentViewModelBase with _$AccidentViewModel;

abstract class _AccidentViewModelBase with Store {
  final LocationService _locationService = LocationService();

  final FirebaseDatabaseService _databaseService =
      locator<FirebaseDatabaseService>();

  @observable
  File? imageFile;

  @observable
  String? reportDescription;

  @observable
  Position? currentLocation;

  @observable
  String? reportDate;

  @action
  Future<void> setProfileImage() async {
    final ImagePicker _picker = ImagePicker();
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
  Future<void> reportEmergency() async {
    currentLocation = await _locationService.getCurrentPosition();
    await _databaseService.addEmergency(
      EmergencyModel(
        emergencyLocationLatitude: currentLocation!.latitude.toStringAsFixed(1),
        emergencyLocationLongitude:
            currentLocation!.longitude.toStringAsFixed(1),
      ),
    );
  }

  @action
  Future<void> updateEmergency(String? fire, String? peopleCount,
      String? consciousness, String? bleeding) async {
    FirebaseFirestore.instance
        .collection("emergency")
        .doc(
          currentLocation!.latitude.toString() +
              currentLocation!.longitude.toString(),
        )
        .update({
      "fire": fire,
      "peopleCount": peopleCount,
      "consciousness": consciousness,
      "bleeding": bleeding,
    });
  }
}
