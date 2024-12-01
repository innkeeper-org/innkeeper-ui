import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/screens/create_reservation/create_reservation_page_view.dart';
import 'package:frontend/front_office/screens/home/fo_home.dart';
import 'package:frontend/front_office/screens/home/widgets/current_status.dart';
import 'package:frontend/front_office/widgets/guest_registration.dart';

class FOAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // TODO: implement build
    return  AppBar(
      centerTitle: false,
      backgroundColor: theme.secondaryHeaderColor,
      title: Wrap(
        children: [
          TextButton(
              onPressed: () {},
              child: Text("Calendar View")
          ),
          TextButton(
              onPressed: () {},
              child: Text("Current Status")
          ),
          TextButton(
              onPressed: () {},
              child: Text("Pending Invoices")
          ),
          TextButton(
              onPressed: () {},
              child: Text("Recent Activities")
          )
        ],
      ),

      actions: const [
        Wrap(
          children: [
            Text("Property : "),
            Text("Lemon Tree  ", style: TextStyle(
              fontWeight: FontWeight.bold,
            ),)
          ],
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MainBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return
      Scaffold(
        appBar: FOAppBar(),
          body: CurrentStatus()
      );

  }

}