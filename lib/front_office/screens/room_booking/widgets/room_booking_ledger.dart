import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/billing_account.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/repository/billing_account_repository.dart';

class RoomBookingLedger extends StatelessWidget {
  RoomBooking roomBooking;
  RoomBookingLedger({super.key, required this.roomBooking});
  List<String> tableHeaders = ["SNo", "Date",  "Room No.", "Particulars", "Charges", "Payments"];

  TableRow getHeader(ThemeData theme) {
    return TableRow(
      children: tableHeaders.map((h) =>
        Text(h, style: theme.textTheme.headlineSmall)).toList(),
    );
  }

  List<TableRow> getEntries(BillingAccount billingAccount) {
    List<TableRow> entries = [];
    for(Payment payment in billingAccount.paymentList) {
      entries.add(TableRow(
          children: [
            Text((entries.length + 1).toString()),
            Text(payment.dateTime.toString()),
            Text("-"),
            Text(payment.reference),
            const Text(""),
            Text(payment.amount.toString())
          ]
      ));
    }
    for(Charge charge in billingAccount.chargeList) {
      entries.add(TableRow(
          children: [
            Text((entries.length + 1).toString()),
            Text(charge.dateTime.toString()),
            Text(roomBooking.room.toString()),
            Text(charge.description),
            Text(charge.amount().toString()),
            Text("")
          ]
      ));
    }
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    BillingAccount billingAccount = BillingAccountRepository.getDefaultBillingAccount(roomBooking: roomBooking);

    List<TableRow> entries = [];
    entries.add(getHeader(theme));
    entries.addAll(getEntries(billingAccount));

    return Container(
        padding: const EdgeInsets.all(20),

        child: Table(
          border: TableBorder.all(width: 0.5, color: Colors.grey,),
          columnWidths: const {
            0: FlexColumnWidth(0.3),
            1: FlexColumnWidth(0.6),
            2: FlexColumnWidth(0.4),
            3: FlexColumnWidth(1),
            4: FlexColumnWidth(0.5),
            5: FlexColumnWidth(0.5)
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: entries
        )
    );
  }
}
