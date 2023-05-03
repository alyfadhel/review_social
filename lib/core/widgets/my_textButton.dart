import 'package:flutter/material.dart';


class MyTextButton extends StatelessWidget {

  final  Function() onPressedTextButton;
  final String text;
  final bool isUpperCase;
  final TextStyle? style;

  const MyTextButton({
    Key? key,
    required this.onPressedTextButton,
    required this.text,
    this.style,
    this.isUpperCase = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedTextButton,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: style,
      ),
    );
  }
}
