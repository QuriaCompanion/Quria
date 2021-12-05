import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quria/presentation/screens/home.dart';
import 'package:quria/presentation/screens/login.dart';
import 'package:quria/presentation/screens/profile.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => LoginWidget());
      case "/logged":
        return MaterialPageRoute(builder: (_) => HomeWidget());
      case "/profile":
        return MaterialPageRoute(builder: (_) => ProfileWidget());
      default:
        return MaterialPageRoute(builder: (_) => LoginWidget());
    }
  }
}
