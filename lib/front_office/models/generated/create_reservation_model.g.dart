// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../create_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReservationModel _$CreateReservationModelFromJson(
        Map<String, dynamic> json) =>
    CreateReservationModel(
      guest: Guest.fromJson(json['guest'] as Map<String, dynamic>),
      roomBookings: (json['roomBookings'] as List<dynamic>)
          .map((e) => RoomBooking.fromJson(e as Map<String, dynamic>))
          .toList(),
      billing: BillingInformationModel.fromJson(
          json['billing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateReservationModelToJson(
        CreateReservationModel instance) =>
    <String, dynamic>{
      'guest': instance.guest,
      'roomBookings': instance.roomBookings,
      'billing': instance.billing,
    };
