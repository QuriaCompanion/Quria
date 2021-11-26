import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quria/presentation/screens/home.dart';
import 'package:quria/presentation/screens/login.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => LoginWidget());
      case "/logged":
        return MaterialPageRoute(builder: (_) => const HomeWidget());
      default:
        return MaterialPageRoute(builder: (_) => LoginWidget());
    }
  }
}
