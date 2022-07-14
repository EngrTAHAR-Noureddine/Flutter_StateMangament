import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_redux_flutter/redux/state/AppState.dart';
import 'package:my_redux_flutter/redux/store/R_Store.dart';
import 'package:my_redux_flutter/view/home.dart';


void main() {

  StoreSingleton().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StoreProvider<AppState>(

        store: StoreSingleton().store,
        child: MaterialApp(
          theme: ThemeData.dark(),
          title: "redux",
          home: const HomePage()
        )
    );

  }
}
