import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

enum RoomStatus {
  BOOKED,
  BLOCKED,
  CLEANING,
  CHECKED_IN,
  READY;
}

@JsonSerializable()
class Room {
  final String name;
  final RoomStatus status;
  final String category;
  RoomBooking? roomBooking;
  String? comment;

  Room({required this.name, required this.status, required this.category, this.roomBooking, this.comment});
  static String getRandomCategory() {
    List<String> categories = ["Deluxe", "Executive", "Family Suite"];
    return categories[Random().nextInt(categories.length)];
  }

  static RoomStatus getRandomStatus() {
    return RoomStatus.values[Random().nextInt(RoomStatus.values.length)];
  }

  static Room getRandomRoom(String name) {
    RoomStatus status = getRandomStatus();
    RoomBooking? roomBooking;
    Room room = Room(name: name, status: status, category: getRandomCategory());
    if(status == RoomStatus.BOOKED || status == RoomStatus.CHECKED_IN) {
      roomBooking = RoomBooking.generateRandomRoomBooking(room);
    }
    room.roomBooking = roomBooking;
    return room;
  }

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}