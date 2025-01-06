
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/billing_account.dart';
import 'package:frontend/front_office/repository/room_booking_repository.dart';
import 'package:frontend/front_office/screens/room_booking/widgets/room_booking_list_view.dart';

class BillingAccountDetail extends StatelessWidget {
  final BillingAccount billingAccount;
  const BillingAccountDetail({super.key, required this.billingAccount});


  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return
      Card(
          elevation: 1,
          color: themeData.secondaryHeaderColor,
          shape: const ContinuousRectangleBorder(),
          child: DefaultTabController(length: 3,
              initialIndex: 0,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("Billing Account Detail"),
                  bottom: const TabBar(
                      tabs: <Widget>[
                        Tab(text:"Overview", icon: Icon(Icons.info)),
                        Tab(text: "Room Allotments", icon: Icon(Icons.local_hotel)),
                        // Tab(text: "Billing Account", icon: Icon(Icons.list))
                      ]),
                ),
                body: TabBarView(
                    children: <Widget>[
                      // RoomBookingOverview(roomBooking: roomBooking),
                      RoomBookingListView(roomBookingList: billingAccount.roomBookingList ?? []),
                      // RoomBookingLedger(roomBooking: roomBooking),
                    ]),
                // floatingActionButton: ExpandableFab(distance: 112,
                //   initialOpen: false,
                //   children: [
                //     ActionButton(
                //       onPressed: () {},
                //       icon: const Icon(Icons.money),
                //       description: "Add charge",
                //     ),
                //     ActionButton(
                //       onPressed: () {},
                //       icon: const Icon(Icons.exit_to_app),
                //       description: "Checkout",
                //     ),
                //     ActionButton(
                //       onPressed: () {},
                //       icon: const Icon(Icons.print),
                //       description: "Print Statement",
                //     ),
                //   ],
                // ),
              ))
      );
  }
}