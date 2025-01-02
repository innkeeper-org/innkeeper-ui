import 'package:json_annotation/json_annotation.dart';

part 'RoomInformationModel.g.dart';

@JsonSerializable()
class RoomInformationModel {
  final String roomType;
  final String roomNumber;
  final String adults;
  final String children;
  final String nights;
  final String rate;

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
