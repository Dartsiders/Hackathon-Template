import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackathontemplate/core/models/auto_emergency/auto_emergency_model.dart';
import 'package:hackathontemplate/core/models/emergency/emergency_model.dart';
import 'package:hackathontemplate/core/models/emergency_contact/emergency_contact_model.dart';

import '../../models/user_model/user_model.dart';

import 'database_service.dart';

class FirebaseDatabaseService implements DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> userReadDatabase(String? userId) async {
    final UserModel _usrModel = await _firebaseFirestore
        .collection("users")
        .doc(userId)
        .get()
        .then((value) {
      return UserModel.fromJson(value.data());
    });
    return _usrModel;
  }

  @override
  Future<bool> userSaveDatabase(UserModel userModel) async {
    final documentRef =
        _firebaseFirestore.collection("users").doc(userModel.userId);
    await documentRef.set(userModel.toJson());
    return true;
  }

  @override
  Future<bool> userControlDatabase(String? userId) async {
    return _firebaseFirestore
        .collection("users")
        .doc(userId)
        .get()
        .then((value) {
      if (value.exists) {
        //print('Kullanıcı zaten oluşturulmuş');
        return true;
      } else {
        //print('Kullanıcı oluşturulmamış');
        return false;
      }
    });
  }

  Future<bool> checkSameLocation(EmergencyModel emergencyModel) async {
    final resultLatitude = await FirebaseFirestore.instance
        .collection("emergency")
        .where(
          "emergencyLocationLatitude",
          isEqualTo: emergencyModel.emergencyLocationLatitude,
        )
        .get();
    final resultLongitude = await FirebaseFirestore.instance
        .collection("emergency")
        .where(
          "emergencyLocationLongitude",
          isEqualTo: emergencyModel.emergencyLocationLongitude,
        )
        .get();
    return resultLatitude.docs.isEmpty && resultLongitude.docs.isEmpty;
  }

  @override
  Future<void> saveEmergencyContact(
      UserModel userModel, EmergencyContactModel emergencyContactModel) async {
    var documentRef = await _firebaseFirestore
        .collection("users")
        .doc(userModel.userId)
        .collection("emergencycontacts")
        .doc();
    emergencyContactModel.emergencyContactId = documentRef.id;
    documentRef.set(emergencyContactModel.toJson());
  }

  @override
  Future<List<EmergencyContactModel>> getEmergencyContact(
      UserModel userModel) async {
    var contactList = await _firebaseFirestore
        .collection("users")
        .doc(userModel.userId)
        .collection("emergencycontacts")
        .get()
        .then((value) => value.docs.map((doc) {
              return EmergencyContactModel.fromJson(doc.data());
            }).toList());
    return contactList;
  }

  @override
  Future<void> addEmergency(EmergencyModel emergencyModel) async {
    final bool valid = await checkSameLocation(emergencyModel);
    if (!valid) {
      Fluttertoast.showToast(
        msg: "Acil Durum Çoktan Belirtildi Dikkatiniz İçin Teşekkürler",
      );
    } else {
      final document = _firebaseFirestore.collection("emergency").doc();
      emergencyModel.emergencyId = document.id;
      emergencyModel.emergencyTime = Timestamp.now().toDate();
      document.set(emergencyModel.toJson());
    }
  }

  @override
  Future<void> saveAutoEmergency(
      UserModel userModel, AutoEmergencyModel autoEmergencyModel) async {
    var documentRef = await _firebaseFirestore.collection("autoemergency").doc();
    autoEmergencyModel.autoEmergencyId = documentRef.id;
    autoEmergencyModel.autoEmergencyTime = Timestamp.now().toDate();
    documentRef.set(autoEmergencyModel.toJson());

    var documentRef1 = await _firebaseFirestore
        .collection("users")
        .doc(userModel.userId)
        .collection("autoemergency")
        .doc(autoEmergencyModel.autoEmergencyId);
    documentRef.set(autoEmergencyModel.toJson());
  }

   @override
  Future<List<AutoEmergencyModel>> getUserEmergency(
      UserModel userModel) async {
     var autoEmergencyList = await _firebaseFirestore
        .collection("users")
        .doc(userModel.userId)
        .collection("autoemergency")
        .get()
        .then((value) => value.docs.map((doc) {
              return AutoEmergencyModel.fromJson(doc.data());
            }).toList());
    return autoEmergencyList;
  }
}
