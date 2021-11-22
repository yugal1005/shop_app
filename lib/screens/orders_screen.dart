import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/main_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widget/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/order";
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItem(orderData.order[i]),
        itemCount: orderData.order.length,
      ),
    );
  }
}
