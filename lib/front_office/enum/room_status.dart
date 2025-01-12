enum RoomStatus {
  READY,
  BOOKED,
  BLOCKED,
  CLEANING,
  CHECKED_IN;

  @override
  String toString() {
    return super.toString().split('.').last;
  }
}
