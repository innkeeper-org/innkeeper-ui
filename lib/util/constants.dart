class Constants {
  static const Map<String, dynamic> emptyCreateReservationModel = {
    "guest": {
      "name": "",
      "phone": "",
      "email": "",
      "company":""
    },
    "rooms": [
      {
        "roomType": "",
        "roomNumber":"",
        "adults":"",
        "children":"",
        "nights":"",
        "rate":"",
      },
    ],
    "billing": {
      "invoiceNumber":""
    },
  };

  static const Map<String, dynamic> emptyRoomInformationModel ={
    "roomType": "",
    "roomNumber":"",
    "adults":"",
    "children":"",
    "nights":"",
    "rate":"",
  };
}