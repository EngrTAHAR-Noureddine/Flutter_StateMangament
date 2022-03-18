import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FutureProviderFlutter extends StatelessWidget {
  const FutureProviderFlutter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureProvider<MyModel>( //                      <--- FutureProvider
      initialData: MyModel(someValue: 'default value'),
      create: (context) => someAsyncFunctionToGetMyModel(),
      child:  Scaffold(
          appBar: AppBar(title: const Text('Future Provider')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>( //                    <--- Consumer
                    builder: (context, myModel, child) {
                      return RaisedButton(
                        child: const Text('Do something'),
                        onPressed: (){
                          myModel.doSomething();
                        },
                      );
                    },
                  )
              ),

              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),

            ],
          ),
        ),

    );

  }
}

Future<MyModel> someAsyncFunctionToGetMyModel() async { //  <--- async function
  await Future.delayed(const Duration(seconds: 3));
  return MyModel(someValue: 'new data');
}

class MyModel { //                                               <--- MyModel
  MyModel({required this.someValue});
  String someValue = 'Hello';
  Future<void> doSomething() async {
    await Future.delayed(const Duration(seconds: 2));
    someValue = 'Goodbye';
    print(someValue);
  }
}