import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KCustomShowErrorMessageIfExists {
  final String alertTitle;
  final String errorImageIconpath;
  final BuildContext context;
  final String buttonName;
  final String navigateToPageNamed;
  final FirebaseAuth authenticationInstance;
  const KCustomShowErrorMessageIfExists({
    required this.alertTitle,
    required this.authenticationInstance,
    required this.navigateToPageNamed,
    required this.errorImageIconpath,
    required this.context,
    required this.buttonName,
  });

  void showAlertOnERR(context) {
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(alertTitle),
            content: Card(
              child: Image(
                image: AssetImage(errorImageIconpath),
                height: 100,
                width: 100,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  await authenticationInstance.signOut();
                  if (context.mounted) {
                    Navigator.of(context).pop();

                    Navigator.pushReplacementNamed(
                      context,
                      navigateToPageNamed,
                    );
                  }
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
