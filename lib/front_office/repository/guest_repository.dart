import 'dart:ffi';

import 'package:frontend/front_office/models/guest.dart';
import 'package:frontend/front_office/models/GuestRegistrationRequest.dart';

abstract class GuestRepository {
  Future<Guest> registerGuest(GuestRegistrationRequest request);
  Future<Guest> getGuestByMobile(Long mobile);
}