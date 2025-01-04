// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomInformationModel _$RoomInformationModelFromJson(
        Map<String, dynamic> json) =>
    RoomInformationModel(
      roomType: json['roomType'] as String,
      roomNumber: json['roomNumber'] as String,
      adults: json['adults'] as String,
      children: json['children'] as String,
      nights: json['nights'] as String,
      rate: json['rate'] as String,
    );

Map<String, dynamic> _$RoomInformationModelToJson(
        RoomInformationModel instance) =>
    <String, dynamic>{
      'roomType': instance.roomType,
      'roomNumber': instance.roomNumber,
      'adults': instance.adults,
      'children': instance.children,
      'nights': instance.nights,
      'rate': instance.rate,
    };
