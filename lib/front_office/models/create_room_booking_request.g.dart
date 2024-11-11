// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_room_booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRoomBookingRequest _$CreateRoomBookingRequestFromJson(
        Map<String, dynamic> json) =>
    CreateRoomBookingRequest(
      billingAccountId: json['billingAccountId'] as String,
      roomBookingList: (json['roomBookingList'] as List<dynamic>)
          .map((e) => RoomBooking.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateRoomBookingRequestToJson(
        CreateRoomBookingRequest instance) =>
    <String, dynamic>{
      'billingAccountId': instance.billingAccountId,
      'roomBookingList': instance.roomBookingList,
    };
