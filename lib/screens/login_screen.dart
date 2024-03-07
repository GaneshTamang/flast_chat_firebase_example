import 'package:flast_chat_firebase_example/constants.dart';
import 'package:flast_chat_firebase_example/custom_widgets/custom_material_button.dart';
import 'package:flast_chat_firebase_example/services/firebase_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String pageID = "Log In Page";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController typedEmail = TextEditingController();
  TextEditingController typedPassword = TextEditingController();
  bool navigating = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headingStyle(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(
                  hintText: 'email_example@example.com',
                ),
                controller: typedEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.center,
                decoration: textInputDecoration.copyWith(
                  alignLabelWithHint: true,
                  hintText: 'Type Password',
                ),
                controller: typedPassword,
              ),
            ),
            KCustomMaterialButton(
              buttonName: 'Log In',
              onTapCallBack: () async {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  await FirebaseService().loginService(
                    typedEmail: typedEmail.text,
                    typedPassword: typedPassword.text,
                    context: context,
                  );

//Your Navigation code will be here
                });
              },
              buttonColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Row headingStyle() {
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
                offset: Offset(4, 3),
                blurRadius: 3,
              ),
            ],
          ),
        ),
        Text(
          'Log In',
          style: welcomeLogoStyleText.copyWith(
            color: Colors.green,
            fontSize: 40,
          ),
        )
      ],
    );
  }
}
