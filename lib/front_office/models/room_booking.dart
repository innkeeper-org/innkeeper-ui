import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/guest.dart';
import 'package:frontend/front_office/models/price.dart';
import 'package:frontend/front_office/models/room.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enum/room_booking_status.dart';

part 'generated/room_booking.g.dart';

@JsonSerializable()
class RoomBooking {
  String roomBookingId;
  late RoomBookingStatus status;
  Guest? guest;
  Room room;
  DateTime? checkIn;
  DateTime? checkOut;
  DateTime bookingCheckIn;
  DateTime bookingCheckOut;
  Price price;
  late int pax;
  RoomBooking(
      {required this.roomBookingId,
      required this.room,
      required this.bookingCheckIn,
      required this.bookingCheckOut,
      required this.price,
      status,
      pax}) {
    this.status = status ?? RoomBookingStatus.BOOKED;
    this.pax = 1;
  }

  _checkIn(DateTime time) {
    checkIn = time;
  }

  static RoomBooking generateRandomRoomBooking(Room room) {
    DateTime checkIn = DateTime.now().add(Duration(days: Random().nextInt(15)));
    DateTime checkOut = checkIn.add(Duration(days: Random().nextInt(2)));
    double priceWithoutTax = (1500.00 + Random().nextInt(1000));
    Price price =
        Price(priceWithoutTax: priceWithoutTax, discountRate: 10, taxRate: 12);
    RoomBooking roomBooking = new RoomBooking(
        roomBookingId: Random().nextInt(1000).toString(),
        room: room,
        bookingCheckIn: checkIn,
        bookingCheckOut: checkOut,
        price: price);
    List<String> guestNames = [
      "Mr Bob",
      "Mr Raju",
      "Mrs Rita",
      "Mrs Neha",
      "Taneja"
    ];
    roomBooking.guest = new Guest(
        name: guestNames[Random().nextInt(guestNames.length)],
        phone: "1234567890",
        email: "abc@abc.com",
        company: "ABC Pvt Ltd.");
    roomBooking.status = RoomBookingStatus
        .values[Random().nextInt(RoomBookingStatus.values.length)];
    if (roomBooking.status == RoomBookingStatus.CHECKED_OUT)
      roomBooking.status = RoomBookingStatus.BOOKED;
    roomBooking._checkIn(checkIn);
    return roomBooking;
  }

  Color getRoomStatusColor() {
    switch (status) {
      case RoomBookingStatus.BOOKED:
        return Colors.blue;
      case RoomBookingStatus.CHECKED_IN:
        return Colors.green;
      case RoomBookingStatus.CANCELLED:
        return Colors.grey;
      default:
        return Colors.pink;
    }
  }

  factory RoomBooking.fromJson(Map<String, dynamic> json) =>
      _$RoomBookingFromJson(json);
  Map<String, dynamic> toJson() => _$RoomBookingToJson(this);
}
