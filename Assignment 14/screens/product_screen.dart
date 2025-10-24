import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
import '../models/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductController controller = ProductController();

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    await controller.fetchProducts();
    setState(() {});
  }

  void showProductDialog({Product? product}) {
    final nameController = TextEditingController(text: product?.name ?? '');
    final imgController = TextEditingController(text: product?.img ?? '');
    final qtyController =
    TextEditingController(text: product?.qty?.toString() ?? '');
    final unitPriceController =
    TextEditingController(text: product?.unitPrice?.toString() ?? '');
    final totalPriceController =
    TextEditingController(text: product?.totalPrice?.toString() ?? '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(product == null ? "Add Product" : "Update Product"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: "Product Name")),
              TextField(controller: imgController, decoration: InputDecoration(labelText: "Image URL")),
              TextField(controller: qtyController, decoration: InputDecoration(labelText: "Quantity")),
              TextField(controller: unitPriceController, decoration: InputDecoration(labelText: "Unit Price")),
              TextField(controller: totalPriceController, decoration: InputDecoration(labelText: "Total Price")),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () async {
              if (product == null) {
                await controller.createProduct(
                  nameController.text,
                  imgController.text,
                  int.parse(qtyController.text),
                  int.parse(unitPriceController.text),
                  int.parse(totalPriceController.text),
                );
              } else {
                await controller.updateProduct(
                  product.id!,
                  nameController.text,
                  imgController.text,
                  int.parse(qtyController.text),
                  int.parse(unitPriceController.text),
                  int.parse(totalPriceController.text),
                );
              }
              await loadProducts();
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product CRUD')),
      body: controller.products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          final product = controller.products[index];
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    product.img ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
                  ),
                ),
                Text(product.name ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("৳${product.unitPrice} | QTY: ${product.qty}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () => showProductDialog(product: product), icon: const Icon(Icons.edit, color: Colors.green)),
                    IconButton(
                      onPressed: () async {
                        await controller.deleteProduct(product.id!);
                        await loadProducts();
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showProductDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
