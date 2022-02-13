import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathontemplate/core/models/emergency_contact/emergency_contact_model.dart';

import '../../models/user_model/user_model.dart';

import 'database_service.dart';

class FirebaseDatabaseService implements DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  //final AccidentViewModel _accidentViewModel = AccidentViewModel();

  @override
  Future<UserModel> userReadDatabase(String? userId) async {
    final UserModel _usrModel = await _firebaseFirestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
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
        .doc(FirebaseAuth.instance.currentUser!.email)
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
    final documentRef = _firebaseFirestore
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
    final contactList = await _firebaseFirestore
        .collection("users")
        .doc(userModel.userId)
        .collection("emergencycontacts")
        .get()
        .then(
          (value) => value.docs.map((doc) {
            return EmergencyContactModel.fromJson(doc.data());
          }).toList(),
        );
    return contactList;
  }
}
