import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: const CircleAvatar(
        backgroundColor: blackLight,
        child: Icon(Icons.clear, size: 20, color: Colors.white),
      ),
    );
  }
}
