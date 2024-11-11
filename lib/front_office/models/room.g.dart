// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      name: json['name'] as String,
      status: $enumDecode(_$RoomStatusEnumMap, json['status']),
      category: json['category'] as String,
      roomBooking: json['roomBooking'] == null
          ? null
          : RoomBooking.fromJson(json['roomBooking'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'name': instance.name,
      'status': _$RoomStatusEnumMap[instance.status]!,
      'category': instance.category,
      'roomBooking': instance.roomBooking,
    };

const _$RoomStatusEnumMap = {
  RoomStatus.BOOKED: 'BOOKED',
  RoomStatus.BLOCKED: 'BLOCKED',
  RoomStatus.CLEANING: 'CLEANING',
  RoomStatus.CHECKED_IN: 'CHECKED_IN',
  RoomStatus.READY: 'READY',
};
