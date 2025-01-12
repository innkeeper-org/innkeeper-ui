// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) => Guest(
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      company: json['company'] as String?,
      address: json['address'] as String? ??
          "12 Ashima Vihar, Turner Road, Dehradun",
    );

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'company': instance.company,
      'email': instance.email,
      'address': instance.address,
    };
