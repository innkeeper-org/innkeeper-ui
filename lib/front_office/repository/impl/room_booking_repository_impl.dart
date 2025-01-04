import 'dart:math';

import 'package:dio/dio.dart';
import 'package:frontend/front_office/models/create_room_booking_request.dart';
import 'package:frontend/front_office/models/room.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/repository/room_booking_repository.dart';
import 'package:frontend/front_office/util/dio_fo_client.dart';
import 'package:frontend/util/dio_client.dart';

class RoomBookingRepositoryImpl implements RoomBookingRepository {
  @override
  Future<List<RoomBooking>> createNewBooking({
    required CreateRoomBookingRequest createRoomBookingRequest
}) async {

    DioFOClient dioClient = DioFOClient();
    final response = await dioClient.get().post("/1/rooms/book", data : createRoomBookingRequest);
    return await dioClient.handleResponse<List<RoomBooking>>(response: response,
        fromJson: (json) => RoomBooking.fromJson(json),
        isList: true);
  }

  @override
  Future<List<Room>> getAvailability({required DateTime from, required DateTime to}) async {
      DioFOClient dioClient = DioFOClient();
      final response = await dioClient.get().post("/rooms/availability", data : {
        'from' : from.toIso8601String(),
        'to' : to.toIso8601String()
      });
      return await dioClient.handleResponse<List<Room>>(response : response,
          fromJson: (json) => Room.fromJson(json),
          isList: true);
  }

  @override
  Future<RoomBooking> getRoomBooking({required int id}) async {
    DioFOClient dioFOClient = DioFOClient();
    final response = await dioFOClient.get(propertyId: 2).get("/rooms/book", data: {id});
    return await dioFOClient.handleResponse(response: response, fromJson: (json) => RoomBooking.fromJson(json));
  }

  @override
  Future<List<RoomBooking>> getRoomBookingByDate({required DateTime from, required DateTime to}) async {
    DioFOClient dioClient = DioFOClient();
    final response = await dioClient.get().post("/rooms/bookings", data : {
      'from' : from.toIso8601String(),
      'to' : to.toIso8601String()
    });
    return await dioClient.handleResponse<List<RoomBooking>>(response : response,
        fromJson: (json) => RoomBooking.fromJson(json),
        isList: true);
  }
  }
}