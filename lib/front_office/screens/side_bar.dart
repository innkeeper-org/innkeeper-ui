import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {

  static const TextStyle optionStyle = TextStyle(
      color: Colors.white
  );
  static const List<Text> sideBarOptions = [
    Text("Front Office", style: optionStyle),
    Text("Expenses", style: optionStyle),
    Text("Reports", style: optionStyle),
    Text("Admin", style: optionStyle)
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return
      Container (
        width: 250,
        color: theme.primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child : Text(
                          'Innkeeper',
                          style: theme.primaryTextTheme.headlineMedium,
                        )
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child:
                        Wrap(
                            children: [
                              Text(
                                'Simple & Effective Hospitality Solution',
                                  style: theme.primaryTextTheme.bodySmall
                              )
                            ])
                    )
                  ],
                ),
              ),
            ),
            ...sideBarOptions.map((option) {
              return ListTile(
                title: option,
                selected: _selectedIndex == sideBarOptions.indexOf(option) ,
                onTap: () {
                  _selectedIndex = sideBarOptions.indexOf(option);
                },
              );
            })

          ],
        ),
      );
  }

}