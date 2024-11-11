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
      priceWithoutTax: (json['priceWithoutTax'] as num).toDouble(),
      taxRate: (json['taxRate'] as num).toDouble(),
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
      'guest': instance.guest,
      'room': instance.room,
      'checkIn': instance.checkIn?.toIso8601String(),
      'checkOut': instance.checkOut?.toIso8601String(),
      'bookingCheckIn': instance.bookingCheckIn.toIso8601String(),
      'bookingCheckOut': instance.bookingCheckOut.toIso8601String(),
      'priceWithoutTax': instance.priceWithoutTax,
      'taxRate': instance.taxRate,
    };
