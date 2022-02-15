import 'package:flutter/material.dart';
import 'package:quria/presentation/var/routes.dart';
import 'components/nav_item.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);
  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: const [
          NavigationItem(
            title: 'Collection',
            routeName: routeCollection,
          ),
          NavigationItem(
            title: 'Home',
            routeName: routeLogin,
          ),
          NavigationItem(
            title: 'Profile',
            routeName: '/profile',
          ),
          NavigationItem(
            title: 'Builder',
            routeName: routeExotic,
          ),
        ],
      ),
    );
  }
}
