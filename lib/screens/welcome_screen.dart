import 'package:flast_chat_firebase_example/constants.dart';
import 'package:flast_chat_firebase_example/custom_widgets/custom_material_button.dart';
import 'package:flast_chat_firebase_example/custom_widgets/gradient_text.dart';
import 'package:flast_chat_firebase_example/screens/login_screen.dart';
import 'package:flast_chat_firebase_example/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  static String pageID = "Welcome_screen";
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController typedEmail = TextEditingController();
  TextEditingController typedPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        return await alertWhenExitingApp(context);
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              headingWelcomeScreen(),
              KCustomMaterialButton(
                buttonName: 'Login page',
                buttonColor: Colors.blueAccent,
                onTapCallBack: () {
                  Navigator.pushNamed(context, LoginScreen.pageID);
                },
              ),
              KCustomMaterialButton(
                buttonName: 'Registration Page',
                buttonColor: Colors.blueAccent,
                onTapCallBack: () {
                  Navigator.pushNamed(context, RegistrationScreen.pageID);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> alertWhenExitingApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Exit App ?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    Navigator.of(context).pop(true);
                    SystemNavigator.pop();
                  },
                  child: const Text('yes')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('no')),
            ],
          );
        });
  }

  Row headingWelcomeScreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Hero(
          tag: "Main Icon",
          child: Icon(
            Icons.flash_on,
            color: Colors.orange,
            size: 70,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(5, 3),
                blurRadius: 5,
              ),
            ],
          ),
        ),
        GradientText(
          gradientText: 'Flash_ChaT',
          textStyle: welcomeLogoStyleText,
          gradientColor: const LinearGradient(
            colors: [
              Colors.purple,
              Colors.red,
              Colors.orangeAccent,
            ],
          ),
        ),
      ],
    );
  }
}
