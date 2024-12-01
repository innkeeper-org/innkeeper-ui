
import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/screens/main_bar.dart';
import 'package:frontend/front_office/widgets/guest_registration.dart';
import 'package:frontend/front_office/screens/side_bar.dart';

class FrontOfficeHomePage extends StatefulWidget {
  final String title;

  const FrontOfficeHomePage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _FrontOfficeHomePageState();
}

class _FrontOfficeHomePageState extends State<FrontOfficeHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
              child: MainBar(),
          )
        ],
      ),
    );
  }
}