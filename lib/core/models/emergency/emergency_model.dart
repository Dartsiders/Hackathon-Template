import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emergency_model.g.dart';

@JsonSerializable()
class EmergencyModel {
  String? emergencyId;
  String? emergencyDetail;
  String? emergencyLocationLatitude;
  String? emergencyLocationLongitude;
  String? emergencyLocation;
  String? emergencyPhotoUrl;
  String? emergencyStatus;
  @JsonKey(fromJson: getDateFromTimeStamp, toJson: getTimeStampFromDate)
  DateTime? emergencyTime;
  String? emergencyUserId;
  String? emergencyUserName;


  EmergencyModel({
    this.emergencyId,
    this.emergencyDetail,
    this.emergencyLocationLatitude,
    this.emergencyLocationLongitude,
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

DateTime? getDateFromTimeStamp(Timestamp? timeStamp) {
   return timeStamp?.toDate();
 }

 Timestamp? getTimeStampFromDate(DateTime? dateTime) {
   return dateTime != null ? Timestamp.fromDate(dateTime) : null;
 }
