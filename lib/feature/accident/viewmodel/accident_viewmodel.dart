import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:hackathontemplate/core/services/location/location_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'accident_viewmodel.g.dart';

class AccidentViewModel = _AccidentViewModelBase with _$AccidentViewModel;

abstract class _AccidentViewModelBase with Store {
  final LocationService _locationService = LocationService();

  @observable
  File? imageFile;

  @observable
  Position? currentLocation;

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
  Future<void> getCurrentLocation() async {
    currentLocation = await _locationService.getCurrentPosition();
    print(currentLocation!.latitude);
    print(DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()));
  }
}
