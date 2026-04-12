import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Product> cart = [];
  String selectedCategory = "all";

  Future<void> fetchProducts() async {
    final url = Uri.parse("https://dummyjson.com/products");
    final res = await http.get(url);

    final data = jsonDecode(res.body);

    products = data.map<Product>((e) => Product.fromJson(e)).toList();
    notifyListeners();
  }

  List<Product> get filteredProducts {
    if (selectedCategory == "all") return products;

    return products
        .where((p) => p.category == selectedCategory)
        .toList();
  }

  void setCategory(String cat) {
    selectedCategory = cat;
    notifyListeners();
  }

  void addToCart(Product p) {
    cart.add(p);
    notifyListeners();
  }
}