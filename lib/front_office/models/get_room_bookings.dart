import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GetRoomBookings {
  DateTime from;
  DateTime to;
  GetRoomBookings ({
    required this.from,
    required this.to
});
  factory GetRoomBookings.fromJson(Map<String, dynamic> json) => _$GetRoomBookingsFromJson(json);
  Map<String, dynamic> toJson() => _$GetRoomBookingsToJson(this);
}