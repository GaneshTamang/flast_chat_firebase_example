import 'package:firebase_auth/firebase_auth.dart';
import 'package:flast_chat_firebase_example/constants.dart';
import 'package:flast_chat_firebase_example/services/firebase_service.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String pageID = "Chat Page";
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? currentLoggedInUser;

  currentUser() {
    User? user = _auth.currentUser;
    if (user != null) {
      currentLoggedInUser = user.email!;
    } else {
      currentLoggedInUser = 'null: no user';
    }
  }

  @override
  void initState() {
    currentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: 'Main Icon',
              child: Icon(
                Icons.flash_on,
                color: Colors.yellow,
                size: 40,
              ),
            ),
            Text(
              'Chat',
              style: appTextStyle,
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              FirebaseService().logOutService(context);
            },
            child: const Icon(
              Icons.close,
              size: 40,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Center(
        child: Text(currentLoggedInUser!),
      ),
    );
  }
}
