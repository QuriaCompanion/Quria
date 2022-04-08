import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quria/constants/styles.dart';
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
          apiKey: 'AIzaSyAHPZS_6edfw4AVLW4VM1_hhkxrVUk9Mr0',
          appId: '1:653536181122:web:c81569f39c669fc18eed9b',
          messagingSenderId: '653536181122',
          projectId: 'quriacompanion-13944'));

  await dotenv.load(fileName: ".env");
  runApp(Container(
    decoration: const BoxDecoration(color: black),
    child: QuriaApp(
      router: AppRouter(),
    ),
  ));
}

class QuriaApp extends StatelessWidget {
  final AppRouter router;

  const QuriaApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
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
