import 'package:flutter/material.dart';
import '../models/massage.dart';
import '../services/api_service.dart';
import '../widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [];
  TextEditingController controller = TextEditingController();
  bool isLoading = false;

  void sendMessage() async {
    if (controller.text.trim().isEmpty) return;

    String userText = controller.text;

    setState(() {
      messages.add(Message(
        role: "user",
        text: userText,
        time: DateTime.now(),
      ));
      controller.clear();
      isLoading = true;
    });

    String reply = await ApiService.sendMessage(userText);

    setState(() {
      messages.add(Message(
        role: "assistant",
        text: reply,
        time: DateTime.now(),
      ));
      isLoading = false;
    });
  }

  Widget buildInput() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Type message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.teal,
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white),
              onPressed: sendMessage,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAF4F2),
      appBar: AppBar(
        title: Text("AI Chat"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return ChatBubble(
                  text: msg.text,
                  isUser: msg.role == "user",
                );
              },
            ),
          ),

          if (isLoading)
            Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),

          buildInput(),
        ],
      ),
    );
  }
}