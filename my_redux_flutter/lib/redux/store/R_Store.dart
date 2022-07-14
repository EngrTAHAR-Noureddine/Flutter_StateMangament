import 'package:redux/redux.dart';


import '../reducer/AppReducer.dart';
import '../state/AppState.dart';


class StoreSingleton{
  static final StoreSingleton _storeSingleton = StoreSingleton._internal();

  factory StoreSingleton() {
    return _storeSingleton;
  }

  StoreSingleton._internal();

  late Store<AppState> store;

  initialize(){

    store = Store<AppState>(
      appReducer ,
      initialState: AppState.initial(),
    );

  }

}
