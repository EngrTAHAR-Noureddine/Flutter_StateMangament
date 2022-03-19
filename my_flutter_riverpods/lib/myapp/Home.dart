import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_riverpods/myapp/futureproviders/AboutFuture.dart';

import 'customWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
        child: AboutFutureProvider()  //CustomWidget()
    );
  }
}
