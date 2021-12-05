import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quria/presentation/screens/builder.dart';
import 'package:quria/presentation/screens/home.dart';
import 'package:quria/presentation/screens/login.dart';
import 'package:quria/presentation/var/routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => LoginWidget());
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomeWidget());
      case routeBuilder:
        return MaterialPageRoute(builder: (_) => BuilderWidget());
      default:
        return MaterialPageRoute(builder: (_) => LoginWidget());
    }
  }
}
