import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathontemplate/core/models/emergency/emergency_model.dart';
import 'package:hackathontemplate/core/models/emergency_contact/emergency_contact_model.dart';
import 'package:hackathontemplate/core/services/storage/firebase_storage_service.dart';

import '../../locator/locator.dart';
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
    final document = _firebaseFirestore.collection("emergency").doc();
    emergencyModel.emergencyId = document.id;
    emergencyModel.emergencyTime = Timestamp.now().toDate();
    document.set(emergencyModel.toJson());
  }
}
