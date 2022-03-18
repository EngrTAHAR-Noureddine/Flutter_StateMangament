import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final helloWorldProvider = Provider((_) => 'Hello world');

class CustomWidget extends ConsumerWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Riverpod"),
      ),
      body:
      Center(
        child: Text(value , style: const TextStyle(color: Colors.black , fontSize: 24, ),),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add,color: Colors.white),
      ),
    );
  }
}