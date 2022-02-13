import 'package:flutter/material.dart';
import 'package:quria/presentation/screens/builder/builder.dart';
import 'package:quria/presentation/screens/builder/exotic.dart';
import 'package:quria/presentation/screens/home.dart';
import 'package:quria/presentation/screens/login.dart';
import 'package:quria/presentation/screens/profile/profile.dart';
import 'package:quria/presentation/var/routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeLogin:
        return MaterialPageRoute(builder: (_) => HomeWidget());
      case routeProfile:
        return MaterialPageRoute(builder: (_) => const ProfileWidget());
      case routeBuilder:
        return MaterialPageRoute(builder: (_) => const BuilderWidget());
      case routeExotic:
        return MaterialPageRoute(builder: (_) => const ExoticWidget());
      default:
        return MaterialPageRoute(builder: (_) => LoginWidget());
    }
  }
}
