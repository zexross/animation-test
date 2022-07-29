import 'package:flutter/material.dart';

class PlatformFlatButton extends StatelessWidget {
  final Function handler;
  final Widget buttonChild;
  final Color color;

  const PlatformFlatButton(
      {Key? key, required this.buttonChild,
      required this.color,
      required this.handler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          backgroundColor: color),
      onPressed: handler as void Function()?,
      child: buttonChild,
    );
  }
}