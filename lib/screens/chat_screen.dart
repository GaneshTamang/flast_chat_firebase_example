import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  TextEditingController typedTextmessage = TextEditingController();
  String? currentLoggedInUser;

  currentUser() {
    User? loggedInUser = _auth.currentUser;
    if (loggedInUser != null) {
      currentLoggedInUser = loggedInUser.email!;
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: appBarForChatScreen(context),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: typedTextmessage,
                        maxLines: null,
                        decoration: textInputDecoration.copyWith(
                            hintText: "Type Your Message ...."),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Map<String, dynamic> user = {
                          'sender': currentLoggedInUser!,
                          'text': typedTextmessage.text,
                          'date': DateTime.now(),
                        };
                        _db.collection("messages").add(user).then(
                            (DocumentReference doc) => print(
                                'DocumentSnapshot added with ID: ${doc.id}'));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Send',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  AppBar appBarForChatScreen(BuildContext context) {
    return AppBar(
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
    );
  }
}
