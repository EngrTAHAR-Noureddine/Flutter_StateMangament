

import 'package:my_redux_flutter/redux/action/Actions.dart';

import '../state/CartsState.dart';

CartsState cartsReducer(CartsState state, dynamic action) {

  CartsState newState = state;

  switch (action.type) {

    case CartAction.LIST_CART:
      // payload is List of CartItem
      newState.listCarts = action.payload;
      return newState;

    case CartAction.NEW_CART:
      //payload is CartItem
      newState.listCarts = List.from(state.listCarts)..add(action.payload);
      return newState;

    case CartAction.SET_CHECKING:
      // payload is Map<String,dynamic> = { index : index, isChecked: true/false }
      newState.listCarts[action.payload['index']].checked = action.payload['isChecked'];
      return newState;

    default:
         return newState;
  }
}