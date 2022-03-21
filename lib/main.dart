import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/app.dart';
import 'package:quria/presentation/router.dart';
import 'package:quria/presentation/var/routes.dart';

void main() async {
  StorageService.init();
  WidgetsFlutterBinding.ensureInitialized();
  // todo : use .env data
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAtmjDBRzaxM9YAQhOhFS_ryC5gaTjxjbI',
          appId: 'quria-f5c32.firebaseapp.com',
          messagingSenderId: '668020606368',
          projectId: 'quria-f5c32'));
          
  await dotenv.load(fileName: ".env");
  runApp(QuriaApp(
    router: AppRouter(),
  ));
}

class QuriaApp extends StatelessWidget {
  final AppRouter router;

  const QuriaApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      builder: (_, child) => AppView(
        child: child!,
      ),
      initialRoute: routeLogin,
      navigatorKey: navKey,
    );
  }
}
