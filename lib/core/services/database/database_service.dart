import '../../models/emergency/emergency_model.dart';
import '../../models/emergency_contact/emergency_contact_model.dart';
import '../../models/user_model/user_model.dart';

abstract class DatabaseService {
  Future<bool> userSaveDatabase(UserModel userModel);
  Future<UserModel> userReadDatabase(String? userId);
  Future<bool> userControlDatabase(String? userId);

  Future<void> saveEmergencyContact(
      UserModel userModel, EmergencyContactModel emergencyContactModel);
  Future<void> addEmergency(EmergencyModel emergencyModel);
}
