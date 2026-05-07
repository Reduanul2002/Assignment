import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ChatBubble extends StatelessWidget {

  final String message;
  final bool isUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: isUser
          ? Alignment.centerRight
          : Alignment.centerLeft,

      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),

        padding: const EdgeInsets.all(14),

        constraints: const BoxConstraints(
          maxWidth: 300,
        ),

        decoration: BoxDecoration(
          color: isUser
              ? AppColors.userBubble
              : AppColors.aiBubble,

          borderRadius:
          BorderRadius.circular(18),
        ),

        child: Text(
          message,

          style: TextStyle(
            color: isUser
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}