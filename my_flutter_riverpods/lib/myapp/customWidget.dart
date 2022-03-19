import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_riverpods/myapp/wihstatenotifier/ClickStateNotifier.dart';
import 'package:my_flutter_riverpods/myapp/withchangenotifier/ClickCHangeNotifier.dart';


final helloWorldProvider = Provider((_) => 'Hello world'); // always provider is Final

//imple values that change over time  use : StateProvider , is better but when using many state is bad way
// so use change is better way when use many state
final counterProvider = StateProvider((ref) => 0);

//Using CHange notifier
final changeNotifier = ChangeNotifierProvider<ClickChangeNotifier>((ref)=> ClickChangeNotifier(),);
// Using State Notifier ( is best practice in programming)
final clickStateNotifier = StateNotifierProvider<ClickStateNotifier,int>((ref)=> ClickStateNotifier(0));


// StatelessWidget --> ConsumerWidget
//StatefulWidget --> ConsumerStatefulWidget
class CustomWidget extends ConsumerWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch not call in onPressed nor initstate of StatefullWidget
    // and nor async
    /***
     * ref.read() don't use it in Build
     * ref.listen seems like read() or watch but prefer watch to lesten and change ui
     *If you use ref.watch to begin with, you will have fewer problems when refactoring.
      But I wanted to use ref.read to reduce the number of times my widget rebuilds
     *
     *  ***/
    final String value = ref.watch(helloWorldProvider);
    // value retrun 'Hello world'
    final int counter = ref.watch(counterProvider);

    //change notifier
    final notifier = ref.watch(changeNotifier);

    //state notifier
    final stateNotify = ref.watch(clickStateNotifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Riverpod"),
      ),
      body:
          // u can use this ( case : StateProvider)
    /*
    Center(
        child: Text("$counter", style: const TextStyle(color: Colors.black , fontSize: 24, ),),
      ),
      */
      // Case when using CHange Notifier :
      /*Center(
        child: Text("${notifier.click}", style: const TextStyle(color: Colors.black , fontSize: 24, ),),
      ),*/
      // Case when using State Notifier :
      Center(
        child: Text("$stateNotify", style: const TextStyle(color: Colors.black , fontSize: 24, ),),
      ),
      /**
       * or use Consumer like this :
       *  body: Center(
          // Consumer is a widget that allows you reading providers.
          child: Consumer(builder: (context, ref, _) {
          final count = ref.watch(counterProvider.state).state;
          return Text('$count');
          }),
          ),
       * **/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //stateProvider
          ref.read(counterProvider.notifier).state = counter +1;

          //change notifier
          ref.read(changeNotifier.notifier).click = notifier.click +1;

          //State notifier
          ref.read(clickStateNotifier.notifier).increment();

          print(counter);
        },
        child: const Icon(Icons.add,color: Colors.white),
      ),
    );
  }
}

/**
 * Deciding what to read Streaming
 *  final userProvider = StreamProvider<User>(...);
 *
 *  Widget build(BuildContext context, WidgetRef ref) {
        AsyncValue<User> user = ref.watch(userProvider);
    // or use this : Stream<User> user = ref.watch(userProvider.stream);
    // or use this : Future<User> user = ref.watch(userProvider.future);
        return user.when(
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stack) => const Text('Oops'),
                      data: (user) => Text(user.name),
                      );
    }
 *
 *
 *
 * Types or Providers
    Provider — A provider that provides a read only value
    StateProvider — A provider thats value can be modified from outside
    StreamProvider — A provider that creates a stream and exposes it latest event
    FutureProvider — A provider that asynchronously provides a single value
 * **/