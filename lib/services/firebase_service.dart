// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flast_chat_firebase_example/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final FirebaseAuth authentication = FirebaseAuth.instance;

  FirebaseService();

  Future<void> signUpService({
    required String typedEmail,
    required String typedPassword,
    required BuildContext context,
  }) async {
    try {
      await authentication.createUserWithEmailAndPassword(
        email: typedEmail,
        password: typedPassword,
      );
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actions: [
                const Text('CreatedID'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ChatPage.pageID);
                  },
                  child: const Text('Go To chatPage'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                //   child: const Text('ok'),
                // ),
              ],
            );
          },
        );
      }
    } on FirebaseAuthException catch (error) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(error.message!),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('ok'),
                )
              ],
            );
          },
        );
      }
    }
  }
}
