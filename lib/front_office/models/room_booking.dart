import 'package:frontend/front_office/models/room.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RoomBooking {
  String roomBookingId;
  Room room;
  DateTime? checkIn;
  DateTime? checkOut;
  DateTime bookingCheckIn;
  DateTime bookingCheckOut;
  double priceWithoutTax;
  double taxRate;
  RoomBooking({
    required this.roomBookingId,
    required this.room,
    required this.bookingCheckIn,
    required this.bookingCheckOut,
    required this.priceWithoutTax,
    required this.taxRate
});

  factory RoomBooking.fromJson(Map<String, dynamic> json) => _$RoomBookingFromJson(json);
  Map<String, dynamic> toJson() => _$RoomBookingToJson(this);
}