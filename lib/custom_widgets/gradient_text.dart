import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    required this.gradientText,
    this.textStyle,
    required this.gradientColor,
    super.key,
  });
  final String gradientText;
  final TextStyle? textStyle;
  final Gradient gradientColor;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradientColor.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(gradientText, style: textStyle),
    );
  }
}
