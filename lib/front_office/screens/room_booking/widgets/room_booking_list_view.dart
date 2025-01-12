import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/navigations/index.dart';
import 'package:frontend/front_office/repository/room_booking_repository.dart';

class RoomBookingListView extends StatelessWidget {
  List<RoomBooking> roomBookingList;
  RoomBookingListView({super.key, required this.roomBookingList});
  List<String> header = [
    "Guest",
    "Room Number",
    "Status",
    "Pax",
    "Total Price"
  ];

  TableRow getHeader(ThemeData theme, List<String> headerVals) {
    return TableRow(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: theme.primaryColorLight,
      ),
      children: headerVals
          .map((h) => Text(h, style: theme.textTheme.headlineSmall))
          .toList(),
    );
  }

  List<TableRow> tableRows = [];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    tableRows.add(getHeader(theme, header));
    for (RoomBooking roomBooking in roomBookingList) {
      TableRow tableRow = TableRow(
          decoration: BoxDecoration(
              color: roomBooking.getRoomStatusColor().withOpacity(0.5)),
          children: [
            InkWell(
                child: Text(roomBooking.guest?.name ?? "-",
                    style: theme.textTheme.bodyMedium),
                onTap: () => roomBookingNavigation(context, roomBooking)),
            Text(roomBooking.room.name, style: theme.textTheme.bodyMedium),
            Text(roomBooking.status.name, style: theme.textTheme.bodyMedium),
            Text(roomBooking.pax.toString(), style: theme.textTheme.bodyMedium),
            Text(roomBooking.price.getAmount().toString(),
                style: theme.textTheme.bodyMedium),
          ]);
      tableRows.add(tableRow);
    }
    return SingleChildScrollView(
        child: Container(
            child: Table(
      border: TableBorder.all(
        width: 0.5,
        color: Colors.grey,
      ),
      children: tableRows,
    )));
  }
}
