import 'package:flutter/material.dart';

import '../models/message_model.dart';
import '../services/api_service.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/message_input.dart';
import '../widgets/loading_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() =>
      _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController controller =
  TextEditingController();

  List<MessageModel> messages = [];

  bool isLoading = false;

  Future<void> sendMessage() async {

    if (controller.text.trim().isEmpty) return;

    String userText = controller.text;

    setState(() {

      messages.add(
        MessageModel(
          text: userText,
          isUser: true,
        ),
      );

      isLoading = true;
    });

    controller.clear();

    String aiReply =
    await ApiService.sendMessage(userText);

    setState(() {

      messages.add(
        MessageModel(
          text: aiReply,
          isUser: false,
        ),
      );

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Expanded(
          child: ListView.builder(
            itemCount: messages.length,

            itemBuilder: (context, index) {

              final message = messages[index];

              return ChatBubble(
                message: message.text,
                isUser: message.isUser,
              );
            },
          ),
        ),

        if (isLoading)
          const LoadingWidget(),

        MessageInput(
          controller: controller,
          onSend: sendMessage,
        ),
      ],
    );
  }
}