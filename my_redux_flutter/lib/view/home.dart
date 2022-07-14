import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_redux_flutter/model/CartItem.dart';
import 'package:redux/redux.dart';

import '../redux/action/Actions.dart';
import '../redux/action/action_model.dart';
import '../redux/state/AppState.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> callNineOneOne(Store store)async{

    await Future.delayed(const Duration(seconds: 2), () {
      List<CartItem> cartsItem = List.generate(5, (index) => CartItem(name: "name $index", checked: false));

      ActionModel actionModel = ActionModel(type: CartAction.LIST_CART , payload: cartsItem);
      store.dispatch(actionModel);
    },);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping cart"),
        centerTitle: true,
      ),

      floatingActionButton: StoreConnector<AppState, VoidCallback>(
          converter: (store) {
            ActionModel actionModel = ActionModel(type: CartAction.NEW_CART , payload: CartItem(name: "name ${store.state.cartsState.listCarts.length}", checked: false));

            return () => store.dispatch(actionModel);

          },
          builder: (context, callback) {
                      return FloatingActionButton(
                        onPressed: callback,
                        child: const Icon(Icons.add , color: Colors.white,),
                      );
                    }
      ),

      body:StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          ActionModel actionModel = ActionModel(type: CartAction.LOADING , payload: null);
          return () => store.dispatch(actionModel);
        },
          // initialized the list
          onInit: (store)async{

            await callNineOneOne(store);

          } ,
          builder: (context,  callback) {

              return StoreConnector<AppState, List>(
                    converter: (store) => store.state.cartsState.listCarts,

                    builder: (context,  list) {

                            List<CartItem> cartItems = list as List<CartItem>;

                            return ListView.builder(
                                itemCount: cartItems.length,
                                itemBuilder: (context, index){
                                  return ListTile(
                                    title: Text(cartItems[index].name.toString()),
                                    subtitle: Text((cartItems[index].checked)?"Checked":"Non checked"),
                                    onTap: (){},
                                  );
                                });
                                                  },
                      );

        }
      ),

    );
  }
}
