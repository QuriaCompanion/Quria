import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:quria/presentation/var/routes.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final String routeName;

  const NavigationItem({required this.title, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navKey.currentState!.pushNamed(routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Text(
          title,
          style: const TextStyle(fontSize: 12.0),
        ),
      ),
    );
  }
}
