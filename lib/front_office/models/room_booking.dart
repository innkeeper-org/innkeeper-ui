
import 'dart:math';

import 'package:frontend/front_office/models/guest.dart';
import 'package:frontend/front_office/models/room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_booking.g.dart';

@JsonSerializable()
class RoomBooking {
  String roomBookingId;
  Guest? guest;
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

  static RoomBooking generateRandomRoomBooking(Room room) {
    DateTime checkIn = DateTime.now().add(Duration(days: Random().nextInt(100)));
    DateTime checkOut = checkIn.add(Duration(days: Random().nextInt(10)));
    double priceWithoutTax = (1500.00 + Random().nextInt(1000));
    RoomBooking roomBooking = new RoomBooking(roomBookingId: Random().nextInt(1000).toString(), room: room,
        bookingCheckIn: checkIn, bookingCheckOut: checkOut,
        priceWithoutTax: priceWithoutTax, taxRate: 12);
    roomBooking.guest = new Guest(name: "Mr Bob");
    return roomBooking;
  }

  factory RoomBooking.fromJson(Map<String, dynamic> json) => _$RoomBookingFromJson(json);
  Map<String, dynamic> toJson() => _$RoomBookingToJson(this);
}