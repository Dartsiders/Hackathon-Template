import 'dart:io';
import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:hackathontemplate/core/services/location/location_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/models/emergency/emergency_model.dart';
import '../../../../core/services/database/firebase_database_service.dart';
import '../../../../core/services/storage/firebase_storage_service.dart';

part 'accident_viewmodel.g.dart';

class AccidentViewModel = _AccidentViewModelBase with _$AccidentViewModel;

abstract class _AccidentViewModelBase with Store {
  final LocationService _locationService = LocationService();

  final FirebaseStorageService _storageService = FirebaseStorageService();
  final FirebaseDatabaseService _databaseService = FirebaseDatabaseService();

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
  Future<void> reportEmergency(String description) async {
    currentLocation = await _locationService.getCurrentPosition();
    await _databaseService.addEmergency(
      EmergencyModel(
        emergencyDetail: description,
        emergencyLocationLatitude: currentLocation!.latitude.toString(),
        emergencyLocationLongitude: currentLocation!.longitude.toString(),
        emergencyPhotoUrl: await _storageService.emergencyPictureSaveStorage(
          EmergencyModel(
            emergencyId: Random().nextInt(999999).toString(),
          ),
          imageFile!,
        ),
        emergencyStatus: "active",
        emergencyTime: DateTime.now(),
      ),
    );
    print(currentLocation!.latitude);
    print(DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()));
  }
}
