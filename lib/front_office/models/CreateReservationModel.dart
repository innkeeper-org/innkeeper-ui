import 'package:json_annotation/json_annotation.dart';

import 'BillingInformationModel.dart';
import 'GuestInformationModel.dart';
import 'RoomInformationModel.dart';

part 'CreateReservationModel.g.dart';

@JsonSerializable()
class CreateReservationModel {
  GuestInformationModel guest;
  List<RoomInformationModel> rooms;
  BillingInformationModel billing;

  CreateReservationModel(
      {required this.guest, required this.rooms, required this.billing});

  factory CreateReservationModel.fromJson(Map<String,dynamic> json) => _$CreateReservationModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateReservationModelToJson(this);
}
