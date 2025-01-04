// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReservationModel _$CreateReservationModelFromJson(
        Map<String, dynamic> json) =>
    CreateReservationModel(
      guest:
          GuestInformationModel.fromJson(json['guest'] as Map<String, dynamic>),
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomInformationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      billing: BillingInformationModel.fromJson(
          json['billing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateReservationModelToJson(
        CreateReservationModel instance) =>
    <String, dynamic>{
      'guest': instance.guest,
      'rooms': instance.rooms,
      'billing': instance.billing,
    };
