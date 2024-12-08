import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:frontend/home.dart';
import 'package:logging/logging.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Innkeeper",
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent, brightness: Brightness.light),
      canvasColor: Colors.transparent,
    ),
    home: const Home()
    ),
  );
}


