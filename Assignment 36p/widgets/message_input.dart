import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {

  final TextEditingController controller;
  final VoidCallback onSend;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12),

      child: Row(
        children: [

          Expanded(
            child: TextField(
              controller: controller,

              decoration: InputDecoration(
                hintText: "Type message...",

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          CircleAvatar(
            child: IconButton(
              onPressed: onSend,
              icon: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}