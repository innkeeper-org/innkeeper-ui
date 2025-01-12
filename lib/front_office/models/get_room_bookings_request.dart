import 'package:json_annotation/json_annotation.dart';

part 'generated/get_room_bookings_request.g.dart';

@JsonSerializable()
class GetRoomBookingsRequest {
  DateTime from;
  DateTime to;
  GetRoomBookingsRequest({required this.from, required this.to});
  factory GetRoomBookingsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRoomBookingsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetRoomBookingsRequestToJson(this);
}
