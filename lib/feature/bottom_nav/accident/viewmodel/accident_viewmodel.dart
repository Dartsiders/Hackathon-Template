import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathontemplate/core/locator/locator.dart';
import 'package:hackathontemplate/core/services/location/location_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'accident_viewmodel.g.dart';

class AccidentViewModel = _AccidentViewModelBase with _$AccidentViewModel;

abstract class _AccidentViewModelBase with Store {
  final LocationService _locationService = locator.get<LocationService>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<bool> checkSameLocation() async {
    final resultLatitude = await FirebaseFirestore.instance
        .collection("emergency")
        .where(
          "emergencyLocationLatitude",
          isEqualTo: currentLocation!.latitude,
        )
        .get();
    final resultLongitude = await FirebaseFirestore.instance
        .collection("emergency")
        .where(
          "emergencyLocationLongitude",
          isEqualTo: currentLocation!.longitude,
        )
        .get();
    return resultLatitude.docs.isEmpty && resultLongitude.docs.isEmpty;
  }

  @action
  Future<void> reportEmergency() async {
    currentLocation = await _locationService.getCurrentPosition();

    final bool valid = await checkSameLocation();
    if (!valid) {
      Fluttertoast.showToast(
        msg: "Acil Durum Çoktan Belirtildi Dikkatiniz İçin Teşekkürler",
      );
    } else {
      final document = _firestore.collection("emergency").doc(
            currentLocation!.latitude.toString() +
                currentLocation!.longitude.toString(),
          );
      document.set({
        "emergencyId": document.id,
        "emergencyTime": Timestamp.now().toDate(),
        "emergencyStatus": "Active",
        "emergencyLocationLatitude":
            currentLocation!.latitude.toStringAsFixed(1),
        "emergencyLocationLongitude":
            currentLocation!.longitude.toStringAsFixed(1),
      });
    }
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
      "emergencyLocationLatitude": currentLocation!.latitude.toStringAsFixed(1),
      "emergencyLocationLongitude":
          currentLocation!.longitude.toStringAsFixed(1),
      "fire": fire,
      "peopleCount": peopleCount,
      "consciousness": consciousness,
      "bleeding": bleeding,
    });
  }
}
