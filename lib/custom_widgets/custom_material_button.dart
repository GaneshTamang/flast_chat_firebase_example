import 'package:flutter/material.dart';

class KCustomMaterialButton extends StatelessWidget {
  final String buttonName;
  final Function()? onTapCallBack;
  final Color buttonColor;
  const KCustomMaterialButton(
      {super.key,
      required this.buttonName,
      required this.onTapCallBack,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        color: buttonColor,
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        shadowColor: Colors.black,
        child: MaterialButton(
          onPressed: onTapCallBack,
          child: Text(
            buttonName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
