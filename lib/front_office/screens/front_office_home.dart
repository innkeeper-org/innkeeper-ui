import 'package:flutter/material.dart';
import 'package:frontend/front_office/screens/home/widgets/current_status.dart';

import 'create_reservation/create_reservation.dart';

class FOAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FOAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // TODO: implement build
    return AppBar(
      centerTitle: false,
      backgroundColor: theme.secondaryHeaderColor,
      title: Wrap(
        children: [
          TextButton(onPressed: () {}, child: Text("Calendar View")),
          TextButton(onPressed: () {}, child: Text("Current Status")),
          TextButton(onPressed: () {}, child: Text("Pending Invoices")),
          TextButton(onPressed: () {}, child: Text("Recent Activities"))
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class FrontOfficeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: FOAppBar(),
      body: CurrentStatus(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Create Reservation"),
        onPressed: () async {
          await showDialog<void>(
              context: context,
              builder: (context) => const AlertDialog(
                    content: CreateReservationPageView(),
                  ));
        },
      ),
    );
  }
}
