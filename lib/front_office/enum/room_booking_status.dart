enum RoomBookingStatus {
  BOOKED,
  CHECKED_IN,
  CHECKED_OUT,
  CANCELLED;

  @override
  String toString() {
    return super.toString().split('.').last;
  }

  static bool isValid(RoomBookingStatus status) {
    return RoomBookingStatus.values.any((e) => e.toString() == status);
  }
}
