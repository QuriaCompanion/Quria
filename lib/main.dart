import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/router.dart';

void main() async {
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
    StorageService.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
