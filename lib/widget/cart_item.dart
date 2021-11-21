import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String prodId;
  final int quantity;
  final double price;
  final String title;

  CartItem({
    @required this.prodId,
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        padding: EdgeInsets.only(right: 20),
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(prodId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Padding(padding: EdgeInsets.all(2), child: Text(title)),
            // hoverColor: Colors.orange,
            leading: CircleAvatar(
              child: FittedBox(
                child: Text("₹$price"),
              ),
            ),
            subtitle: Padding(
                padding: EdgeInsets.all(3),
                child: Text("Total: ₹${price * quantity}")),
            trailing: Text("${quantity}x"),
          ),
        ),
      ),
    );
  }
}
