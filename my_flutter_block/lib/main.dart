import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Examples/ex_counter/app.dart';
import 'Examples/ex_counter/counter_observer.dart';
import 'counter_bloc/counter_bloc.dart';
import 'counter_bloc/counter_page.dart';
import 'example/ui/MovieHome.dart';

void main() {
  BlocOverrides.runZoned(
        () => runApp(const CounterApp()),
    blocObserver: CounterObserver(),
  );

//  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterPage(),
      ),
    );
    /*
    //Movie home
    return MaterialApp(
      title: 'Flutter Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieHome()
    );
    */
  }
}
