import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widget/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cart-screen";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total"),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      "₹${cart.totalAmount}",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.item.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clear();
                    },
                    child: Text(
                      "ORDER NOW!",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => CartItem(
                prodId: cart.item.keys.toList()[i],
                id: cart.item.values.toList()[i].id,
                title: cart.item.values.toList()[i].title,
                quantity: cart.item.values.toList()[i].quantity,
                price: cart.item.values.toList()[i].price,
              ),
              itemCount: cart.itemCount,
            ),
          )
        ],
      ),
    );
  }
}
