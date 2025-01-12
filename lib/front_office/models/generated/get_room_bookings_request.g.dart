// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_room_bookings_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRoomBookingsRequest _$GetRoomBookingsRequestFromJson(
        Map<String, dynamic> json) =>
    GetRoomBookingsRequest(
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$GetRoomBookingsRequestToJson(
        GetRoomBookingsRequest instance) =>
    <String, dynamic>{
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
    };
