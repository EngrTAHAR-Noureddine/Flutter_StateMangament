import 'package:flutter/material.dart';

import 'example/ui/MovieHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Block',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieHome()
    );
  }
}
