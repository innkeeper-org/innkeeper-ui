import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/billing_account.dart';
import 'package:frontend/front_office/repository/billing_account_repository.dart';
import 'package:frontend/front_office/repository/room_booking_repository.dart';

import '../../navigations/index.dart';

class InvoiceListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InvoiceListViewState();
}

class _InvoiceListViewState extends State<InvoiceListView> {

  List<BillingAccount> billingAccountList = [];
  @override
  void initState() {
    for(int i = 0; i < 10; i++) {
      billingAccountList.add(BillingAccountRepository.getDefaultBillingAccountForRBL(
          roomBookingList: RoomBookingRepository.getRandomBookings()));
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Billing Accounts",
                style: theme.textTheme.headlineSmall),
            Divider(),
            // RoomListFilter(onToggleRoomStatusChange: onRoomStatusChangeFilter,
            //   onSearchTextChange: onSearchTextChangeFilter,
            //   roomStatusFilterSet: roomStatusFilter,
            //   searchString: searchFilter,),
            Divider(),
            Wrap(
                children: billingAccountList.map((billingAccount) {
                  return BillingAccountCard(billingAccount: billingAccount);
                }).toList()
            )
          ],
        )
    );
  }

}

class BillingAccountCard extends StatelessWidget {
  final BillingAccount billingAccount;
  const BillingAccountCard({super.key, required this.billingAccount});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
        onTap: () => billingAccountNavigation(context, billingAccount),
        child: Container(
            width: 200,
            height: 200,
            padding: EdgeInsets.all(5),
            child: Card(
                color:  billingAccount.getColor(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(billingAccount.guest.name, style: theme.textTheme.headlineMedium),
                    Expanded(
                        child: Text(billingAccount.getBalance().toString())
                    ),
                    Divider(),
                    Text((billingAccount.status == BillingAccountStatus.open
                        && billingAccount.readyForInvoice() ?
                    "Ready For Invoice" : "Open"), style: theme.textTheme.bodyMedium)
                  ],
                )
            )));
  }
}
