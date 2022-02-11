import 'package:json_annotation/json_annotation.dart';

part 'emergency_model.g.dart';

@JsonSerializable()
class EmergencyModel {
  String? emergencyId;
  String? emergencyDetail;
  String? emergencyLocation;
  String? emergencyTime;
  String? emergencyPhotoUrl;
  String? emergencyStatus;
  EmergencyModel({
    this.emergencyId,
    this.emergencyDetail,
    this.emergencyLocation,
    this.emergencyTime,
    this.emergencyPhotoUrl,
    this.emergencyStatus,
  });
  



 
 
  factory EmergencyModel.fromJson(Map<String, dynamic>? json) =>
      _$EmergencyModelFromJson(json!);

  Map<String, dynamic> toJson() {
    return _$EmergencyModelToJson(this);
  }
}
