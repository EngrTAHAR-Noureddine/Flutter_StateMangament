
import '../../model/CartItem.dart';

// carts state : state of list of carts, initializing listCarts with empty list.
class CartsState{

  List<CartItem>  listCarts;

  CartsState({required this.listCarts});


  factory CartsState.initial() => CartsState(listCarts: []);

}