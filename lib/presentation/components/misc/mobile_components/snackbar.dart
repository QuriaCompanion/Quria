import 'package:flutter/material.dart';

class SnackBarCustom extends StatelessWidget {
  final String text;
  final Color color;
  const SnackBarCustom({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text),
      backgroundColor: color,
    );
  }
}
