import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/billing_account.dart';
import 'package:frontend/front_office/models/room_booking.dart';
import 'package:frontend/front_office/repository/billing_account_repository.dart';

class RoomBookingLedger extends StatelessWidget {
  RoomBooking roomBooking;
  RoomBookingLedger({super.key, required this.roomBooking});
  final List<String> chargeTableHeaders =
  ["SNo", "Date",  "Room No.", "Particulars", "Price Without Tax", "Tax %", "Discount %", "Total Amount"];
  final List<String> paymentTableHeaders = [
    "SNo", "Date", "Reference", "Amount"
  ];

  TableRow getHeader(ThemeData theme, List<String> headerVals) {
    return TableRow(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: theme.primaryColorLight,
      ),

      children: headerVals.map((h) =>
          Text(h, style: theme.textTheme.headlineSmall)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    BillingAccount billingAccount = BillingAccountRepository.getDefaultBillingAccount(roomBooking: roomBooking);

    List<TableRow> chargesList = [];
    chargesList.add(getHeader(theme, chargeTableHeaders));
    for(Charge charge in billingAccount.chargeList) {
      chargesList.add(
          TableRow(
              children: [
                Text((chargesList.length).toString(), style: theme.textTheme.bodyMedium),
                Text(charge.dateTime.toString(), style: theme.textTheme.bodyMedium),
                Text(roomBooking.room.toString(), style: theme.textTheme.bodyMedium),
                Text(charge.description, style: theme.textTheme.bodyMedium),
                Text(charge.price.priceWithoutTax.toStringAsFixed(2), style: theme.textTheme.bodyMedium),
                Text(charge.price.taxRate.toString(), style: theme.textTheme.bodyMedium),
                Text("-", style: theme.textTheme.bodyMedium),
                Text(charge.price.getAmount().toStringAsFixed(2), style: theme.textTheme.bodyMedium)
              ]
          ));
    }

    List<TableRow> paymentList = [];
    paymentList.add(getHeader(theme, paymentTableHeaders));
    for(Payment payment in billingAccount.paymentList) {
      paymentList.add(
          TableRow(
              children: [
                Text((paymentList.length).toString(), style: theme.textTheme.bodyMedium),
                Text(payment.dateTime.toString(), style: theme.textTheme.bodyMedium),
                Text(payment.reference, style: theme.textTheme.bodyMedium),
                Text(payment.amount.toStringAsFixed(2), style: theme.textTheme.bodyMedium),
              ]
          )
      );
    }
    double balance = billingAccount.getBalance();
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Charges", style: theme.textTheme.headlineLarge),
                  Table(
                      border: TableBorder.all(width: 0.5, color: Colors.grey,),
                      columnWidths: const {
                        0: FlexColumnWidth(0.3),
                        1: FlexColumnWidth(0.6),
                        2: FlexColumnWidth(0.4),
                        3: FlexColumnWidth(1),
                        4: FlexColumnWidth(0.8),
                        5: FlexColumnWidth(0.3),
                        6: FlexColumnWidth(0.3)
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: chargesList
                  ),
                  Divider(),
                  Text("Payments", style: theme.textTheme.headlineLarge),
                  Table(
                      border: TableBorder.all(width: 0.5, color: Colors.grey,),
                      columnWidths: const {
                        0: FlexColumnWidth(0.1),
                        1: FlexColumnWidth(0.6),
                        2: FlexColumnWidth(1),
                        3: FlexColumnWidth(0.4)
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: paymentList
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Net Balance: ", style: theme.textTheme.headlineSmall),
                      Text(balance.toStringAsFixed(2), style: TextStyle(
                        fontSize: theme.textTheme.headlineSmall?.fontSize,
                        color: balance > 0 ? Colors.red : Colors.green
                      ))
                    ],
                  )
                
                ])
    ));
  }
}
