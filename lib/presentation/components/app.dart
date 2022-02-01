import 'package:flutter/material.dart';

import 'Header/nav_bar.dart';

class AppView extends StatelessWidget {
  final Widget child;

  const AppView({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [const NavBarWidget(), Expanded(child: child)],
      ),
    );
  }
}
