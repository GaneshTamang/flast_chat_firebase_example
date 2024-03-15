import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flast_chat_firebase_example/constants.dart';
import 'package:flast_chat_firebase_example/services/firebase_auth3_service.dart';
import 'package:flast_chat_firebase_example/services/firebase_crud_service.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String pageID = "Chat Page";
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController typedTextmessage = TextEditingController();

  @override
  void initState() {
    // FireBaseCrudService().getMessage();
    FireBaseCrudService().getStreamMessage();
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
            StreamBuilder<QuerySnapshot>(
                stream: db.collection('messages').snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    final messages = snapShot.data?.docs;
                    List<Widget> messageWidget = [];
                    for (QueryDocumentSnapshot message in messages!) {
                      String messageText = message['text'];
                      String sender = message['sender'];
                      Widget singleMessageWiget = Card(
                        child: Column(
                          children: [
                            Text(messageText),
                            Text(sender),
                          ],
                        ),
                      );
                      messageWidget.add(singleMessageWiget);
                    }
                    return Expanded(
                      child: ListView(
                        children: messageWidget,
                      ),
                    );
                  } else if (!snapShot.hasData || snapShot.hasError) {
                    return const Text('No Data');
                  } else if (snapShot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    );
                  } else {
                    return const Text('error or  no Data');
                  }
                }),
            typeMessageTextField(),
          ],
        ),
      ),
    );
  }

  Padding typeMessageTextField() {
    return Padding(
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
            onTap: () async {
              if (typedTextmessage.text == "") {
                // ignore: avoid_print
                print('action canceled text empty');
                return;
              } else {
                await FireBaseCrudService()
                    .addDataToDB(typedMessage: typedTextmessage.text);
                typedTextmessage.clear();
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Send',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
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
