import 'dart:ffi';

import 'package:frontend/front_office/models/guest.dart';
import 'package:frontend/front_office/models/guest_registration_request.dart';
import 'package:frontend/front_office/repository/guest_repository.dart';
import 'package:frontend/front_office/util/dio_fo_client.dart';
import 'package:frontend/util/dio_client.dart';

class GuestRepositoryImpl extends GuestRepository {
  @override
  Future<Guest> getGuestByMobile(Long mobile) {
    // TODO: implement getGuestByMobile
    throw UnimplementedError();
  }

  @override
  Future<Guest> registerGuest(GuestRegistrationRequest request) {
      Dio Client dioFOClient = DioFOClient();

  }

}