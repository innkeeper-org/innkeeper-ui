import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:json_annotation/json_annotation.dart';

import 'billing_information_model.dart';
import 'guest.dart';

part 'create_reservation_model.g.dart';

@JsonSerializable()
class CreateReservationModel extends ChangeNotifier {
  Guest guest;
  List<RoomBooking> roomBookings;
  BillingInformationModel billing;

  CreateReservationModel(
      {required this.guest, required this.roomBookings, required this.billing});

  factory CreateReservationModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReservationModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateReservationModelToJson(this);

  Guest get getGuestInformation => guest;
  UnmodifiableListView<RoomBooking> get getRoomBookingList =>
      UnmodifiableListView(roomBookings);
  BillingInformationModel get getBillingInformation => billing;

  void addRoom(RoomBooking room) {
    room.guest = guest;
    roomBookings.add(room);
    notifyListeners();
  }

  void removeRoom(String id) {
    int index = roomBookings.indexWhere((item) => item.roomBookingId == id);
    if (index != -1) {
      roomBookings.removeAt(index);
      notifyListeners();
    }
  }
}
