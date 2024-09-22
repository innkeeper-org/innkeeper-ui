import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Room {
  String name;
  Room({
    required this.name
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}