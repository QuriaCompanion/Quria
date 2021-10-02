import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quria/presentation/screens/login.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => LoginWidget());
      default:
        return MaterialPageRoute(builder: (_) => LoginWidget());
    }
  }
}
