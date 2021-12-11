import 'package:flutter/material.dart';
import 'package:quria/presentation/var/routes.dart';
import 'components/nav_item.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: const [
          NavigationItem(
            title: 'Home',
            routeName: routeHome,
          ),
          NavigationItem(
            title: 'Profile',
            routeName: '/profile',
          ),
          NavigationItem(
            title: 'Settings',
            routeName: "/",
          ),
          NavigationItem(
            title: 'Builder',
            routeName: routeBuilder,
          ),
        ],
      ),
    );
  }
}
