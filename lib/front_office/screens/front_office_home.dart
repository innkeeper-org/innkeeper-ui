import 'package:flutter/material.dart';
import 'package:frontend/front_office/screens/home/widgets/calendar_view_widget.dart';
import 'package:frontend/front_office/screens/home/widgets/current_status.dart';
import 'package:logging/logging.dart';

class FOAppBar extends StatelessWidget implements PreferredSizeWidget {

  final List<String> options;
  final Function onPressed;

  FOAppBar({super.key, required this.options, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // TODO: implement build
    return  AppBar(
      centerTitle: false,
      backgroundColor: theme.secondaryHeaderColor,
      title: Wrap(
        children: options.map((option) =>
         TextButton(
           onPressed: () => {onPressed(option)},
           child: Text(option),
         ))
          .toList()
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
  List<String> options = ["Calendar View", "Current Status", "Pending Invoices"];
  late String selectedOption;

  _FrontOfficeHomeState() {
    selectedOption = options[0];
  }

  Widget _getBodyContent() {
      switch(selectedOption) {
        case "Calendar View":
          return CalendarViewWidget();
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
          appBar: FOAppBar(options : options, onPressed: (option) => {
            setState(() {
              selectedOption = option;
            }),
            logger.info("Selected option changed to $selectedOption")
          }),
          body: Center(
            child: _getBodyContent(),
          ),
        floatingActionButton: FloatingActionButton(onPressed: (){}),

      );
  }
}