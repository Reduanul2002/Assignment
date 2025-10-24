class ProductModel {
  String? status;
  List<Product>? data;

  ProductModel({this.status, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v));
      });
    }
  }
}

class Product {
  String? id;
  String? name;
  String? img;
  int? qty;
  int? unitPrice;
  int? totalPrice;

  Product({
    this.id,
    this.name,
    this.img,
    this.qty,
    this.unitPrice,
    this.totalPrice,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['ProductName'];
    img = json['Img'];
    qty = json['Qty'];
    unitPrice = json['UnitPrice'];
    totalPrice = json['TotalPrice'];
  }
}
