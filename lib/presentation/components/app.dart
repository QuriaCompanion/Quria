import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

class AppView extends StatelessWidget {
  final Widget child;

  const AppView({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: blackBackground,
      child: child,
    );
  }
}
