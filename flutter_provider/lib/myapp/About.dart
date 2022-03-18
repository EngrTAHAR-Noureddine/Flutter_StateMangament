import 'package:flutter/material.dart';
import 'package:flutter_provider/myapp/AboutProvider.dart';
import 'package:provider/provider.dart';

class FocusProvider extends StatefulWidget {
  const FocusProvider({Key? key}) : super(key: key);

  @override
  State<FocusProvider> createState() => _FocusProviderState();
}

/// *
///  this is Focus Provider
///
/// */

class _FocusProviderState extends State<FocusProvider> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AboutProvider>(
        create: (context) => AboutProvider(),
        child: Builder(
        builder: (context) {
          return Consumer<AboutProvider>(
              builder: (context, focusProvider, child) {
                return  Scaffold(
                  backgroundColor: Colors.white70,
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text("Provider"),
                  ),
                  body:
                  Center(
                    child: Text("${focusProvider.number}" , style: const TextStyle(color: Colors.black , fontSize: 24, ),),
                  ),

                  floatingActionButton: FloatingActionButton(
                    onPressed: () => focusProvider.addNumber(),
                    // context.read<MyProvider>().addNumber(),
                    // use when you want call fct of notifyListeners() out of Consumer<MyProvider>
                    // example in green Comment
                    child: const Icon(Icons.add,color: Colors.white),
                  ),
                );
              });
        }
        )
    );
  }
}
