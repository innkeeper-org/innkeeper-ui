import 'package:frontend/front_office/models/room_booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_room_booking_request.g.dart';

@JsonSerializable()
class CreateRoomBookingRequest {
  String billingAccountId;
  List<RoomBooking> roomBookingList;

  CreateRoomBookingRequest({
    required this.billingAccountId,
    required this.roomBookingList
  });

  factory CreateRoomBookingRequest.fromJson(Map<String, dynamic> json) => _$CreateRoomBookingRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateRoomBookingRequestToJson(this);
}