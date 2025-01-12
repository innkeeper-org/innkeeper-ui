import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enum/room_status.dart';

part 'generated/room.g.dart';

@JsonSerializable()
class Room {
  final String name;
  late RoomStatus status;
  final String category;
  RoomBooking? roomBooking;
  String? comment;

  Room(
      {required this.name,
      status,
      required this.category,
      this.roomBooking,
      this.comment}) {
    this.status = status == "" ? RoomStatus.READY : status;
  }

  @override
  String toString() {
    return name;
  }

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
    if (status == RoomStatus.BOOKED || status == RoomStatus.CHECKED_IN) {
      roomBooking = RoomBooking.generateRandomRoomBooking(room);
      room.roomBooking = roomBooking;
    }
    return room;
  }

  static List<Room> getRoomList() {
    List<Room> list = [];
    list.add(Room(name: "69", status: RoomStatus.READY, category: "Executive"));
    list.add(
        Room(name: "420", status: RoomStatus.READY, category: "Executive"));
    return list;
  }

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);

  bool hasSearchText(String? text) {
    if (text == null || text.isEmpty) return true;
    return name.contains(text) ||
        (roomBooking?.guest?.hasSearchText(text) == true);
  }

  static Color getRoomStatusColor(RoomStatus status) {
    switch (status) {
      case RoomStatus.BOOKED:
        return Colors.lightBlueAccent.shade100;
      case RoomStatus.BLOCKED:
        return Colors.blueGrey.shade300;
      case RoomStatus.CHECKED_IN:
        return Colors.lightBlue;
      case RoomStatus.CLEANING:
        return Colors.limeAccent.shade100;
      case RoomStatus.READY:
      default:
        return Colors.white70;
    }
  }
}
