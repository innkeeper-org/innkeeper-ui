import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/screens/front_office_home.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'front_office/models/property.dart';
import 'front_office/providers/property_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedPage = '';
  late String selectedProperty;
  late PropertyProvider propertyProvider;
  Logger logger = Logger((Home).toString());

  Map<String, List<String>> options = {};

  _HomeState() {
    options = {
      "Hotel Hive": ['Front Office', 'Expenses', 'Accounts'],
      "Chilliz Restaurant": ['Front Office', 'Billing', 'Inventory']
    };
  }

  Widget _getSelectedPage() {
    selectedPage = options[selectedProperty]![0];
    logger.info("$selectedProperty : $selectedPage");
    switch (selectedPage) {
      case 'Front Office':
        return FrontOfficeHome();
      default:
        return const Text("Not implemented");
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    propertyProvider = Provider.of<PropertyProvider>(context, listen: false);
    selectedProperty = propertyProvider.getSelectedProperty().name;
    return Scaffold(
      appBar: AppBar(
        title: Text('Innkeeper', style: theme.textTheme.bodyLarge),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(selectedProperty,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          ),
        ],
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
                        propertyProvider
                            .setSelectedProperty(Property(name: value));
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
          ],
        ),
      ),
      body: Center(child: _getSelectedPage()),
    );
  }
}
