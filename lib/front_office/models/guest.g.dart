// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) => Guest(
      name: json['name'] as String,
    )
      ..phone = json['phone'] as String?
      ..company = json['company'] as String?;

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'company': instance.company,
    };
