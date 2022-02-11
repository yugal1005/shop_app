import 'package:flutter/material.dart';
import 'package:shop_app/screens/user_product_screen.dart';

import '../screens/product_overview_screen.dart';
import '../screens/orders_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListtile(Icon icon, String title, String route) {
      return Padding(
        padding: EdgeInsets.only(left: 10),
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(route);
          },
          contentPadding: EdgeInsets.all(10),
          leading: icon,
          title: Text(title, style: TextStyle(fontSize: 20)),
        ),
      );
    }

    return Drawer(
      elevation: 10,
      child: Column(
        children: [
          Container(
            height: 100,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Shopping!",
              style: TextStyle(
                  fontFamily: "Anton", fontSize: 30, color: Colors.white),
            ),
            alignment: Alignment.bottomCenter,
          ),
          buildListtile(
            Icon(
              Icons.home,
              size: 25,
            ),
            "Home",
            "/",
          ),
          Divider(),
          buildListtile(
            Icon(
              Icons.credit_card,
              size: 25,
            ),
            "Your Orders",
            OrderScreen.routeName,
          ),
          Divider(),
          buildListtile(
            Icon(
              Icons.edit,
              size: 25,
            ),
            "Manage Products",
            UserProductScreen.routeName,
          ),
        ],
      ),
    );
  }
}
