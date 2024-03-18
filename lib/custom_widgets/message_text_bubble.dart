import 'package:flutter/material.dart';

class MessageTextBubble extends StatelessWidget {
  const MessageTextBubble({
    super.key,
    required this.sender,
    required this.messageText,
    required this.isMe,
  });

  final String sender;
  final String messageText;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              color: Colors.blueGrey,
            ),
          ),
          Card(
            shadowColor: Colors.blueGrey,
            shape: isMe
                ? const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(18),
                  ))
                : const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(18),
                  )),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            elevation: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              child: Text(messageText),
            ),
          ),
        ],
      ),
    );
  }
}
