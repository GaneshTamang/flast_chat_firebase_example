import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  static String pageID = "Chat Page";
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ChatPage'),
      ),
    );
  }
}
