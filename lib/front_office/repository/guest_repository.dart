import 'dart:ffi';

import 'package:frontend/front_office/models/guest.dart';
import 'package:frontend/front_office/models/guest_registration_request.dart';

abstract class GuestRepository {
  Future<Guest> registerGuest(GuestRegistrationRequest request);
  Future<Guest> getGuestByMobile(Long mobile);
}
