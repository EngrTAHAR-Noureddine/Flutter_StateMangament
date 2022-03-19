import 'package:flutter_riverpod/flutter_riverpod.dart';


                                  // type of state , like this example we had state is integer
class ClickStateNotifier extends StateNotifier<int>{
  ClickStateNotifier(int state) : super(state);

  void increment(){
    state++;
  }

}