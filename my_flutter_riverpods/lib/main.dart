import 'package:flutter/material.dart';
import 'package:my_flutter_riverpods/myapp/Home.dart';

import 'myapp/futureproviders/AboutFuture.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

