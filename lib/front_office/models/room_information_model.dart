import 'package:json_annotation/json_annotation.dart';

part 'room_information_model.g.dart';

@JsonSerializable()
class RoomInformationModel {
  String roomType;
  String roomNumber;
  String adults;
  String children;
  String nights;
  String rate;

  RoomInformationModel(
      {required this.roomType,
      required this.roomNumber,
      required this.adults,
      required this.children,
      required this.nights,
      required this.rate});

  factory RoomInformationModel.fromJson(Map<String,dynamic> json) => _$RoomInformationModelFromJson(json);
  Map<String,dynamic> toJson() => _$RoomInformationModelToJson(this);
}
