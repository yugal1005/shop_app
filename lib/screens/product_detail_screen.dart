import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detai";

  ProductDetailScreen();
  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  loadedProduct.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "₹${loadedProduct.price}",
                style: TextStyle(color: Colors.grey, fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${loadedProduct.description}",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ));
  }
}
