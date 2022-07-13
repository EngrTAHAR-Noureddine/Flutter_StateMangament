
import 'CartsState.dart';

class AppState {

  final CartsState cartsState;

  AppState({required this.cartsState,});


  factory AppState.initial() => AppState(cartsState: CartsState.initial());

  AppState copyWith({CartsState? cartsS,}) {
    return AppState(
      cartsState: cartsS ?? cartsState, );
  }
}