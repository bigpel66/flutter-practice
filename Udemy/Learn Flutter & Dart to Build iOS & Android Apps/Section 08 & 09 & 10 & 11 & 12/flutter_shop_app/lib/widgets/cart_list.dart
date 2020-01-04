import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './cart_list_item.dart';
import '../screens/orders_screen.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';

class CartList extends StatelessWidget {
  void showOrderList(BuildContext context) {
    Navigator.of(context).pushNamed(
      OrdersScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItem = cart.items.values.toList();
    return Column(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Total', style: TextStyle(fontSize: 20)),
                SizedBox(width: 30),
                Chip(
                  label: Text(
                    '\$${cart.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryTextTheme.title.color,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                Spacer(),
                FlatButton(
                  child: Text('ORDER NOW'),
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false)
                        .addOrder(cartItem, cart.totalPrice);
                    cart.clearCart();
                    if (cartItem.length != 0) showOrderList(context);
                  },
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          elevation: 4,
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (context, index) {
              return CartListItem(
                id: cartItem[index].id,
                title: cartItem[index].title,
                quantity: cartItem[index].quantity,
                price: cartItem[index].price,
                imageUrl: cartItem[index].imageUrl,
              );
            },
          ),
        ),
      ],
    );
  }
}