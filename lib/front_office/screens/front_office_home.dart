import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/property.dart';
import 'package:frontend/front_office/providers/property_provider.dart';
import 'package:frontend/front_office/screens/room_booking/room_booking_all_display.dart';
import 'package:frontend/front_office/screens/room_booking/widgets/room_booking_calendar_view.dart';
import 'package:frontend/front_office/screens/home/current_status.dart';
import 'package:frontend/front_office/screens/room_booking/room_booking_detail_dialog.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class FOAppBar extends StatelessWidget implements PreferredSizeWidget {

  final List<String> options;
  final String selectedOption;
  final Function onPressed;

  FOAppBar({super.key, required this.options, required this.selectedOption, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // TODO: implement build
    return  AppBar(
      centerTitle: false,
      backgroundColor: theme.secondaryHeaderColor,
      title: Wrap(
        children: [...options.map((option) =>
         TextButton(
           onPressed: () => {onPressed(option)},
           child: Text(option,
               style : option == selectedOption ? const TextStyle(fontWeight: FontWeight.bold) : null),
         ))]
      ),


    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class FrontOfficeHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FrontOfficeHomeState();
}

class _FrontOfficeHomeState extends State<FrontOfficeHome> {
  Logger logger = Logger((FrontOfficeHome).toString());
  List<String> options = ["Room Bookings", "Current Status", "Pending Invoices"];
  late String selectedOption;

  _FrontOfficeHomeState() {
    selectedOption = options[0];
  }

  Widget _getBodyContent() {
      switch(selectedOption) {
        case "Room Bookings":
          return RoomBookingDisplay();
        case "Current Status":
          return CurrentStatus();
        default:
          return Text("Unimplemented error");
      }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return
      Scaffold(
          appBar: FOAppBar(options : options, selectedOption:  selectedOption, onPressed: (option) => {
            setState(() {
              selectedOption = option;
            }),
            logger.info("Selected option changed to $selectedOption")
          }),
          body: Center(
            child: _getBodyContent(),
          ),
      );
  }
}