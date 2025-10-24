import 'dart:convert';
import '../models/product_model.dart';
import '../utils/urls.dart';
import 'package:http/http.dart' as http;

class ProductController {
  List<Product> products = [];

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(Urls.readProduct));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ProductModel model = ProductModel.fromJson(data);
      products = model.data ?? [];
    }
  }

  Future<bool> createProduct(
      String name, String img, int qty, int unitPrice, int totalPrice) async {
    final response = await http.post(Uri.parse(Urls.createProduct),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "ProductName": name,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": img,
          "Qty": qty,
          "UnitPrice": unitPrice,
          "TotalPrice": totalPrice
        }));
    print("Create API Status: ${response.statusCode}");
    print("Create API Response: ${response.body}");

    return response.statusCode == 200;
  }

  Future<bool> updateProduct(String id, String name, String img, int qty,
      int unitPrice, int totalPrice) async {
    final response = await http.post(Uri.parse(Urls.updateProduct(id)),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "ProductName": name,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": img,
          "Qty": qty,
          "UnitPrice": unitPrice,
          "TotalPrice": totalPrice
        }));
    print("Update API Status: ${response.statusCode}");
    print("Update API Response: ${response.body}");

    return response.statusCode == 200;
  }

  Future<bool> deleteProduct(String id) async {
    final response = await http.get(Uri.parse(Urls.deleteProduct(id)));
    print("Delete API Status: ${response.statusCode}");
    print("Delete API Response: ${response.body}");
    return response.statusCode == 200;
  }
}
