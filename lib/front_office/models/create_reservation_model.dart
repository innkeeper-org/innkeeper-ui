import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'billing_information_model.dart';
import 'guest.dart';
import 'room_information_model.dart';

part 'create_reservation_model.g.dart';

@JsonSerializable()
class CreateReservationModel extends ChangeNotifier{
  Guest guest;
  List<RoomInformationModel> rooms;
  BillingInformationModel billing;

  CreateReservationModel(
      {required this.guest, required this.rooms, required this.billing});

  factory CreateReservationModel.fromJson(Map<String,dynamic> json) => _$CreateReservationModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateReservationModelToJson(this);

  Guest get getGuestInformation => guest;
  UnmodifiableListView<RoomInformationModel> get getRoomList => UnmodifiableListView(rooms);
  BillingInformationModel get getBillingInformation => billing;

  void addRoom(RoomInformationModel room){
    rooms.add(room);
    notifyListeners();
  }
  void removeRoom(String roomNumber){
    int index = rooms.indexWhere((item) => item.roomNumber==roomNumber);
    if(index!=-1){
      rooms.removeAt(index);
      notifyListeners();
    }
  }
}
