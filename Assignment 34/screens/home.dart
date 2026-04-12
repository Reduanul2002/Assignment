import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import 'cart.dart';
import 'category.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ProductProvider>(context, listen: false).fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce"),
        actions: [
          IconButton(
            icon: Icon(Icons.category),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CategoryScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CartScreen()));
            },
          ),
        ],
      ),

      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        itemCount: provider.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final p = provider.products[index;

          return Card(
            child: Column(
              children: [
                Image.network(p.image, height: 80),
                Text(p.title, maxLines: 2),
              ],
            ),
          );
        },
      ),
    );
  }
}