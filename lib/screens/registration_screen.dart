import 'package:flast_chat_firebase_example/constants.dart';
import 'package:flast_chat_firebase_example/custom_widgets/custom_material_button.dart';
import 'package:flast_chat_firebase_example/services/firebase_auth3_service.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String pageID = "Registration Page";
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController typedEmail = TextEditingController();
  TextEditingController typedPassword = TextEditingController();
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
              buttonName: 'Register ID',
              onTapCallBack: () async {
                await FirebaseService().signUpService(
                  typedEmail: typedEmail.text,
                  typedPassword: typedPassword.text,
                  context: context,
                );
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
          'RegisterAccount',
          style: welcomeLogoStyleText.copyWith(
            color: Colors.green,
            fontSize: 40,
          ),
        )
      ],
    );
  }
}
