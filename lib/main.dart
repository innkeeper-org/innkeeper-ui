import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:frontend/front_office/widgets/guest_registration.dart';

void main() {
  runApp(MaterialApp(
    title: "Innkeeper",
    // theme: ThemeData(
    //   useMaterial3: true,
    //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink, brightness: Brightness.light),
    // ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text("my title"),
      ),
      body:GuestRegistrationWidget(onSubmit: (data) => {

      },),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("click"),
      ),
    ),
  ));
}


