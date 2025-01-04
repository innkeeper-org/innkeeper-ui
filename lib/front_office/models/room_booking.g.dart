// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomBooking _$RoomBookingFromJson(Map<String, dynamic> json) => RoomBooking(
      roomBookingId: json['roomBookingId'] as String,
      room: Room.fromJson(json['room'] as Map<String, dynamic>),
      bookingCheckIn: DateTime.parse(json['bookingCheckIn'] as String),
      bookingCheckOut: DateTime.parse(json['bookingCheckOut'] as String),
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
      status: json['status'],
      pax: json['pax'],
    )
      ..guest = json['guest'] == null
          ? null
          : Guest.fromJson(json['guest'] as Map<String, dynamic>)
      ..checkIn = json['checkIn'] == null
          ? null
          : DateTime.parse(json['checkIn'] as String)
      ..checkOut = json['checkOut'] == null
          ? null
          : DateTime.parse(json['checkOut'] as String);

Map<String, dynamic> _$RoomBookingToJson(RoomBooking instance) =>
    <String, dynamic>{
      'roomBookingId': instance.roomBookingId,
      'status': _$RoomBookingStatusEnumMap[instance.status]!,
      'guest': instance.guest,
      'room': instance.room,
      'checkIn': instance.checkIn?.toIso8601String(),
      'checkOut': instance.checkOut?.toIso8601String(),
      'bookingCheckIn': instance.bookingCheckIn.toIso8601String(),
      'bookingCheckOut': instance.bookingCheckOut.toIso8601String(),
      'price': instance.price,
      'pax': instance.pax,
    };

const _$RoomBookingStatusEnumMap = {
  RoomBookingStatus.BOOKED: 'BOOKED',
  RoomBookingStatus.CHECKED_IN: 'CHECKED_IN',
  RoomBookingStatus.CHECKED_OUT: 'CHECKED_OUT',
  RoomBookingStatus.CANCELLED: 'CANCELLED',
};
