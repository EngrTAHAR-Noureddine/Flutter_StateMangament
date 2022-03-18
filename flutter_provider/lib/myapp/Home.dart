import 'package:flutter/material.dart';
import 'package:flutter_provider/myapp/MyProviderClass.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
        builder: (context, myprovider, child) {
          return  Scaffold(
            backgroundColor: Colors.white70,
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Provider"),
            ),
            body:
            Center(
              child: Text("${myprovider.number}" , style: const TextStyle(color: Colors.black , fontSize: 24, ),),
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () => myprovider.addNumber(),
              // context.read<MyProvider>().addNumber(),
              // use when you want call fct of notifyListeners() out of Consumer<MyProvider>
              // example in green Comment
              child: const Icon(Icons.add,color: Colors.white),
            ),
          );
        });
  }
}

/**
 * this when use context.read<ClassOfChangeNotifier>().fctContainsNotifierListener():
 *
    class _HomeState extends State<Home> {

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white70,
    appBar: AppBar(
    centerTitle: true,
    title: const Text("Provider"),
    ),
    body:Consumer<MyProvider>(
    builder: (context, myprovider, child) {
    return Center(
    child: Text("${myprovider.number}" , style: const TextStyle(color: Colors.black , fontSize: 24, ),),
    );
    },
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () => context.read<MyProvider>().addNumber(),
    child: const Icon(Icons.add,color: Colors.white),
    ),
    );
    }
    }

 *
 * **/
