import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QuriaCompanion"),
      ),
      body: const Center(
        child: Text("QuriaCompanion"),
      ),
    );
  }
}
