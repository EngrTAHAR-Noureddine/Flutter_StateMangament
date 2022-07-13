
import 'package:my_redux_flutter/redux/reducer/CartsReducer.dart';

import '../state/AppState.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    cartsState: cartsReducer(state.cartsState, action),
  );
}