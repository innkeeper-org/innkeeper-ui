import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:frontend/front_office/screens/home/fo_home.dart';
import 'package:frontend/front_office/widgets/guest_registration.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Innkeeper",
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent, brightness: Brightness.light),
    ),
    home: const Scaffold(
      body: FrontOfficeHomePage(title: "Front Office"),
    ),
  ));
}


