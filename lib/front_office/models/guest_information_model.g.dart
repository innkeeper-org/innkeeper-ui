// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestInformationModel _$GuestInformationModelFromJson(
        Map<String, dynamic> json) =>
    GuestInformationModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
    )..company = json['company'] as String?;

Map<String, dynamic> _$GuestInformationModelToJson(
        GuestInformationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'company': instance.company,
      'email': instance.email,
    };
