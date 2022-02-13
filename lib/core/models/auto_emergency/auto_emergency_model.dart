import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auto_emergency_model.g.dart';

@JsonSerializable()
class AutoEmergencyModel {
  String? autoEmergencyUserId;
  String? autoEmergencyUserName;
  String? autoEmergencyUserPhone;
  String? autoEmergencyUserEmail;
  
  String? autoEmergencyId;
  String? autoEmergencyDetail;
  String? autoEmergencyLocationLatitude;
  String? autoEmergencyLocationLongitude;
  String? autoEmergencyStatus;
  @JsonKey(fromJson: getDateFromTimeStamp, toJson: getTimeStampFromDate)
  DateTime? autoEmergencyTime;
  
  AutoEmergencyModel({
    this.autoEmergencyUserId,
    this.autoEmergencyUserName,
    this.autoEmergencyUserPhone,
    this.autoEmergencyUserEmail,
    this.autoEmergencyId,
    this.autoEmergencyDetail,
    this.autoEmergencyLocationLatitude,
    this.autoEmergencyLocationLongitude,
    this.autoEmergencyStatus,
    this.autoEmergencyTime,
  });

  factory AutoEmergencyModel.fromJson(Map<String, dynamic>? json) =>
      _$AutoEmergencyModelFromJson(json!);

  Map<String, dynamic> toJson() {
    return _$AutoEmergencyModelToJson(this);
  }
}

DateTime? getDateFromTimeStamp(Timestamp? timeStamp) {
  return timeStamp?.toDate();
}

Timestamp? getTimeStampFromDate(DateTime? dateTime) {
  return dateTime != null ? Timestamp.fromDate(dateTime) : null;
}
