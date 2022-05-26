import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quria/constants/styles.dart';

class AppView extends StatefulWidget {
  final Widget child;

  const AppView({required this.child, Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: blackLight,
        systemNavigationBarIconBrightness: Brightness.light));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: blackBackground,
      child: widget.child,
    );
  }
}
