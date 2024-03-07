import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseCrudService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  String currentLoggedInUser = "";
  _checkCurrentUser() {
    User? loggedInUser = auth.currentUser;
    if (loggedInUser != null) {
      currentLoggedInUser = loggedInUser.email!;
    } else {
      currentLoggedInUser = 'null: no User Signed In';
    }
  }

  Future<void> addDataToDB({required String typedMessage}) async {
    _checkCurrentUser();
    try {
      Map<String, dynamic> dataToSend = {
        'sender': currentLoggedInUser,
        'text': typedMessage,
        'date': DateTime.now()
      };

      await db.collection('messages').add(dataToSend);
    } catch (e) {
      log(e.toString());
    }
  }

  readMessage() async {
    DocumentReference messages = db.collection("messages").doc();

    print(messages);
  }
}
