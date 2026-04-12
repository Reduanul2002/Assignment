import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Product> cart = [];

  bool isLoading = false;

  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      final data = await ApiService.fetchRecipes();

      products = data.map<Product>((e) => Product.fromJson(e)).toList();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print("ERROR: $e");
      notifyListeners();
    }
  }

  void addToCart(Product p) {
    cart.add(p);
    notifyListeners();
  }
}