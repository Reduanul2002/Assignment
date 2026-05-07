import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'image_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,

      child: Scaffold(

        appBar: AppBar(
          title: const Text("AI Assistant"),

          centerTitle: true,

          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.chat),
                text: "Chat",
              ),

              Tab(
                icon: Icon(Icons.image),
                text: "Image",
              ),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            ChatScreen(),
            ImageScreen(),
          ],
        ),
      ),
    );
  }
}