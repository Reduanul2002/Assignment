import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    final categories = [
      "all",
      ...provider.products.map((e) => e.category).toSet()
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Categories")),

      body: GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final cat = categories[index];

          return GestureDetector(
            onTap: () {
              provider.setCategory(cat);
              Navigator.pop(context);
            },
            child: Card(
              child: Center(child: Text(cat.toUpperCase())),
            ),
          );
        },
      ),
    );
  }
}