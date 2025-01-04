import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/screens/create_reservation/create_reservation.dart';
import 'package:frontend/front_office/screens/front_office_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedPage = '';
  String selectedProperty = 'Hotel Lemon Tree';

  Map<String, List<String>> options = {};

  _HomeState() {
    options = {
      "Hotel Lemon Tree": ['Front Office', 'Expenses', 'Accounts'],
      "Chilliz Restaurant": ['Billing', 'Inventory']
    };
    selectedProperty = options.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Innkeeper', style: theme.textTheme.bodyLarge),
        // actions: const [
        //   Wrap(
        //     children: [
        //       Text("Property : "),
        //       Text("Lemon Tree  ", style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //       ),)
        //     ],
        //   )
        // ],
      ),
      drawer: Drawer(
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Innkeeper', style: theme.textTheme.headlineSmall),
                  Text(
                    "For support kindly reach to 7017002865",
                    style: theme.textTheme.labelSmall,
                  ),
                  Divider(),
                  PopupMenuButton<String>(
                    icon: Row(
                      children: [
                        Text(selectedProperty,
                            style: theme.textTheme.bodySmall),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_drop_down, color: theme.primaryColor)
                      ],
                    ),
                    onSelected: (value) => {
                      setState(() {
                        selectedProperty = value;
                      })
                    },
                    itemBuilder: (BuildContext context) {
                      return options.keys.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice, style: theme.textTheme.bodySmall),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: options.keys.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.work),
                    title: Text(
                      options[selectedProperty]![index],
                      style: theme.textTheme.bodyMedium,
                    ),
                    onTap: () {
                      setState(() {
                        selectedPage = options[selectedProperty]![index];
                        Navigator.pop(context);
                      });
                    },
                  );
                }),
            ElevatedButton(
                onPressed: () async {
                  await showDialog<void>(
                      context: context,
                      builder: (context) => const AlertDialog(
                            content: CreateReservationPageView(),
                          ));
                },
                child: const Text("Create Reservation"))
          ],
        ),
      ),
      body: Center(
        child: FrontOfficeHome(),
      ),
    );
  }
}
