// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_emergency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoEmergencyModel _$AutoEmergencyModelFromJson(Map<String, dynamic> json) {
  return AutoEmergencyModel(
    autoEmergencyUserId: json['autoEmergencyUserId'] as String?,
    autoEmergencyUserName: json['autoEmergencyUserName'] as String?,
    autoEmergencyUserPhone: json['autoEmergencyUserPhone'] as String?,
    autoEmergencyUserEmail: json['autoEmergencyUserEmail'] as String?,
    autoEmergencyId: json['autoEmergencyId'] as String?,
    autoEmergencyDetail: json['autoEmergencyDetail'] as String?,
    autoEmergencyLocationLatitude:
        json['autoEmergencyLocationLatitude'] as String?,
    autoEmergencyLocationLongitude:
        json['autoEmergencyLocationLongitude'] as String?,
    autoEmergencyStatus: json['autoEmergencyStatus'] as String?,
    autoEmergencyTime:
        getDateFromTimeStamp(json['autoEmergencyTime'] as Timestamp?),
  );
}

Map<String, dynamic> _$AutoEmergencyModelToJson(AutoEmergencyModel instance) =>
    <String, dynamic>{
      'autoEmergencyUserId': instance.autoEmergencyUserId,
      'autoEmergencyUserName': instance.autoEmergencyUserName,
      'autoEmergencyUserPhone': instance.autoEmergencyUserPhone,
      'autoEmergencyUserEmail': instance.autoEmergencyUserEmail,
      'autoEmergencyId': instance.autoEmergencyId,
      'autoEmergencyDetail': instance.autoEmergencyDetail,
      'autoEmergencyLocationLatitude': instance.autoEmergencyLocationLatitude,
      'autoEmergencyLocationLongitude': instance.autoEmergencyLocationLongitude,
      'autoEmergencyStatus': instance.autoEmergencyStatus,
      'autoEmergencyTime': getTimeStampFromDate(instance.autoEmergencyTime),
    };
