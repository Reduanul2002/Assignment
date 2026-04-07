import 'package:flutter/material.dart';
import 'video_screen.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic recipe;

  const DetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(recipe['image']),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(recipe['title'],
                  style: TextStyle(fontSize: 20)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VideoScreen()),
                );
              },
              child: Text("Watch Videos"),
            )
          ],
        ),
      ),
    );
  }
}