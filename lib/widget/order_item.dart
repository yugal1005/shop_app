import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as od;

class OrderItem extends StatelessWidget {
  final od.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          ListTile(
            title: Text("₹${order.amount}"),
            subtitle:
                Text(DateFormat("dd/MM/yyyy hh:mm").format(order.dateTime)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
