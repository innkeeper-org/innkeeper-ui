
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/guest.dart';
import 'package:frontend/front_office/models/room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_booking.g.dart';

enum RoomBookingStatus {
  BOOKED,
  CHECKED_IN,
  CHECKED_OUT,
  CANCELLED;
}

@JsonSerializable()
class RoomBooking {
  String roomBookingId;
  RoomBookingStatus? status;
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
    required this.taxRate,
    status
}) {
    this.status = status ?? RoomBookingStatus.BOOKED;
  }

  double totalPrice() {
    return priceWithoutTax * (1 + taxRate / 100);
  }

  static RoomBooking generateRandomRoomBooking(Room room) {
    DateTime checkIn = DateTime.now().add(Duration(days: Random().nextInt(15)));
    DateTime checkOut = checkIn.add(Duration(days: Random().nextInt(2)));
    double priceWithoutTax = (1500.00 + Random().nextInt(1000));
    RoomBooking roomBooking = new RoomBooking(roomBookingId: Random().nextInt(1000).toString(), room: room,
        bookingCheckIn: checkIn, bookingCheckOut: checkOut,
        priceWithoutTax: priceWithoutTax, taxRate: 12);
    List<String> guestNames = ["Mr Bob", "Mr Raju", "Mrs Rita", "Mrs Neha", "Taneja"];
    roomBooking.guest = new Guest(name: guestNames[Random().nextInt(guestNames.length)], phone: "1234567890",
    email: "abc@abc.com", company: "ABC Pvt Ltd.");
    roomBooking.status = RoomBookingStatus.values[Random().nextInt(RoomBookingStatus.values.length)];
    return roomBooking;
  }

  Color getRoomStatusColor() {
    switch(status) {
      case RoomBookingStatus.BOOKED:
        return Colors.blue;
      case RoomBookingStatus.CHECKED_IN:
        return Colors.green;
      case RoomBookingStatus.CANCELLED:
        return Colors.grey;
      default:
        return Colors.lightBlueAccent;
    }
  }

  factory RoomBooking.fromJson(Map<String, dynamic> json) => _$RoomBookingFromJson(json);
  Map<String, dynamic> toJson() => _$RoomBookingToJson(this);
}