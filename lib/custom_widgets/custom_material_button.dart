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
        child: InkWell(
          onTap: onTapCallBack,
          onDoubleTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.blue,
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(20, 20),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
