import 'package:flutter/material.dart';
import 'package:quria/presentation/var/routes.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final String routeName;

  const NavigationItem({required this.title, required this.routeName, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
