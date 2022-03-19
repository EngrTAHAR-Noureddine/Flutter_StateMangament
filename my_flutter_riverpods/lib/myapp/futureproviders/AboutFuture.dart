import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final tokenProvider = FutureProvider((ref)async{

  final Uri uri = Uri.parse("https://raw.githubusercontent.com/EngrTAHAR-Noureddine/EgyBest/master/src/DataJSON/movies.json");
  final response = await Dio().getUri(uri);
  return response.data;

});


class AboutFutureProvider extends ConsumerWidget {
  const AboutFutureProvider({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenValue = ref.watch(tokenProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('future provider'),),
      body: Center(
        child: tokenValue.when(
            data: (data) => Text('data : $data'),
            error: (error,_) => Text( error.toString() ),
            loading:()=> const CircularProgressIndicator()
        ),
      ),
    );
  }
}


