import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'BillingInformationModel.dart';
import 'guest_information_model.dart';
import 'room_information_model.dart';

part 'create_reservation_model.g.dart';

@JsonSerializable()
class CreateReservationModel extends ChangeNotifier{
  GuestInformationModel guest;
  List<RoomInformationModel> rooms;
  BillingInformationModel billing;

  CreateReservationModel(
      {required this.guest, required this.rooms, required this.billing});

  factory CreateReservationModel.fromJson(Map<String,dynamic> json) => _$CreateReservationModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateReservationModelToJson(this);

  GuestInformationModel get getGuestInformation => guest;
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
