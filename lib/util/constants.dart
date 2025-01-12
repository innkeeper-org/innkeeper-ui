class Constants {
  static const Map<String, dynamic> emptyCreateReservationModel = {
    "guest": {"name": "", "phone": "", "email": "", "company": ""},
    "roomBookings": [
      emptyRoomBookingModel
    ],
    "billing": {"invoiceNumber": ""},
  };

  static const Map<String, dynamic> emptyRoomBookingModel = {
    "roomBookingId": "",
    "room": {
      "name":"",
      "status":"",
      "category":"",
    },
    "bookingCheckIn": epochDate,
    "bookingCheckOut": epochDate,
    "price": {
      "priceWithoutTax":0,
      "discountRate":0,
      "taxRate":0
    },
  };
  static const String epochDate = "1970-01-01 00:00:00.000";
}
