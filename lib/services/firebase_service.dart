// ignore_for_file: avoid_print,

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flast_chat_firebase_example/constants.dart';
import 'package:flast_chat_firebase_example/screens/chat_screen.dart';
import 'package:flast_chat_firebase_example/screens/welcome_screen.dart';

import 'package:flutter/material.dart';

class FirebaseService {
  final FirebaseAuth authentication = FirebaseAuth.instance;
  Future<void> logOutService(BuildContext context) async {
    try {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("logOut ?"),
              content: const Card(
                child: Image(
                  image: AssetImage('images/confused.png'),
                  height: 100,
                  width: 100,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    await authentication.signOut();
                    if (context.mounted) {
                      Navigator.of(context).pop();

                      Navigator.pushReplacementNamed(
                          context, WelcomeScreen.pageID);
                    }
                  },
                  child: const Text('ok'),
                )
              ],
            );
          },
        );
      }
    } on FirebaseAuthException catch (errorAuth) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(errorAuth.message!),
              content: const Card(
                child: Image(
                  image: AssetImage('images/confused.png'),
                  height: 100,
                  width: 100,
                ),
              ),
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

  Future<void> loginService({
    required String typedEmail,
    required String typedPassword,
    required BuildContext context,
  }) async {
    try {
      await authentication.signInWithEmailAndPassword(
          email: typedEmail, password: typedPassword);
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, ChatScreen.pageID);
      }
    } on FirebaseAuthException catch (error) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(error.message!),
              content: const Card(
                child: Image(
                  image: AssetImage('images/confused.png'),
                  height: 100,
                  width: 100,
                ),
              ),
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
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('images/okey.png'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text(
                    'Created id successfully',
                    textAlign: TextAlign.center,
                    style: appTextStyle,
                  )
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, ChatScreen.pageID);
                  },
                  child: const Text('Go To chatPage'),
                ),
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
              content: const Card(
                child: Image(
                  image: AssetImage('images/confused.png'),
                  height: 150,
                  width: 150,
                ),
              ),
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
