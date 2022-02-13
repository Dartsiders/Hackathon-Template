// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyModel _$EmergencyModelFromJson(Map<String, dynamic> json) {
  return EmergencyModel(
    emergencyId: json['emergencyId'] as String?,
    emergencyDetail: json['emergencyDetail'] as String?,
    emergencyLocationLatitude: json['emergencyLocationLatitude'] as String?,
    emergencyLocationLongitude: json['emergencyLocationLongitude'] as String?,
    emergencyLocation: json['emergencyLocation'] as String?,
    emergencyTime: getDateFromTimeStamp(json['emergencyTime'] as Timestamp?),
    emergencyPhotoUrl: json['emergencyPhotoUrl'] as String?,
    emergencyStatus: json['emergencyStatus'] as String?,
  )
    ..emergencyUserId = json['emergencyUserId'] as String?
    ..emergencyUserName = json['emergencyUserName'] as String?;
}

Map<String, dynamic> _$EmergencyModelToJson(EmergencyModel instance) =>
    <String, dynamic>{
      'emergencyId': instance.emergencyId,
      'emergencyDetail': instance.emergencyDetail,
      'emergencyLocationLatitude': instance.emergencyLocationLatitude,
      'emergencyLocationLongitude': instance.emergencyLocationLongitude,
      'emergencyLocation': instance.emergencyLocation,
      'emergencyPhotoUrl': instance.emergencyPhotoUrl,
      'emergencyStatus': instance.emergencyStatus,
      'emergencyTime': getTimeStampFromDate(instance.emergencyTime),
      'emergencyUserId': instance.emergencyUserId,
      'emergencyUserName': instance.emergencyUserName,
    };
