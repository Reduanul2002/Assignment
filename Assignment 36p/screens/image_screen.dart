import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() =>
      _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  final TextEditingController controller =
  TextEditingController();

  bool isLoading = false;

  String imageUrl = "";

  Future<void> generateImage() async {

    if (controller.text.trim().isEmpty) return;

    setState(() {
      isLoading = true;
    });

    final url =
    await ApiService.generateImage(
      controller.text,
    );

    setState(() {
      imageUrl = url;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),

      child: Column(
        children: [

          TextField(
            controller: controller,

            decoration: InputDecoration(
              hintText: "Enter prompt",

              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(15),
              ),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: generateImage,
            child: const Text(
              "Generate Image",
            ),
          ),

          const SizedBox(height: 20),

          if (isLoading)
            const CircularProgressIndicator(),

          if (imageUrl.isNotEmpty)
            Expanded(
              child: Image.network(imageUrl),
            ),
        ],
      ),
    );
  }
}