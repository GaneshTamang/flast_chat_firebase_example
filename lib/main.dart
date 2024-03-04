import 'package:firebase_core/firebase_core.dart';
import 'package:flast_chat_firebase_example/firebase_options.dart';
import 'package:flast_chat_firebase_example/screens/chat_screen.dart';
import 'package:flast_chat_firebase_example/screens/login_screen.dart';
import 'package:flast_chat_firebase_example/screens/registration_screen.dart';
import 'package:flast_chat_firebase_example/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FlashChatApp());
}

class FlashChatApp extends StatelessWidget {
  const FlashChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Chat App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.pageID,
      routes: {
        WelcomeScreen.pageID: (context) => const WelcomeScreen(),
        RegistrationScreen.pageID: (context) => const RegistrationScreen(),
        LoginScreen.pageID: (context) => const LoginScreen(),
        ChatScreen.pageID: (context) => const ChatScreen(),
      },
    );
  }
}
