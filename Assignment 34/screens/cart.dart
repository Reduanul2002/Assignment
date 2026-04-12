import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: ListView.builder(
        itemCount: provider.cart.length,
        itemBuilder: (context, index) {
          final item = provider.cart[index];

          return ListTile(
            leading: Image.network(item.image),
            title: Text(item.title),
            subtitle: Text("৳${item.price}"),
          );
        },
      ),
    );
  }
}