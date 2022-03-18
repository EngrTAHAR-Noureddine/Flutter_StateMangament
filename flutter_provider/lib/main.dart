import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'myapp/About.dart';
import 'myapp/Home.dart';
import 'myapp/MyProviderClass.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          // this for root Changes
          ChangeNotifierProvider(create: (_) => MyProvider()),
        ],
        child: const MyApp(),
      )
     );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FocusProvider(), //Home(), // home of root changes
    );
  }
}


