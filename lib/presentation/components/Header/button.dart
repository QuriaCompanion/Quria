import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String value;
  Button({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: Text(value, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
