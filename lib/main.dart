import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/providers/builder/builder_exotic_provider.dart';
import 'package:quria/data/providers/builder/builder_stats_filter_provider.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/app.dart';
import 'package:quria/presentation/router.dart';
import 'package:quria/presentation/screens/login.dart';
import 'package:quria/presentation/var/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageService.init();
  await dotenv.load(fileName: ".env");
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(QuriaApp(
    router: AppRouter(),
  ));
}

class QuriaApp extends StatelessWidget {
  final AppRouter router;

  const QuriaApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BuilderExoticProvider>(
          create: (context) => BuilderExoticProvider(),
        ),
        ChangeNotifierProvider<BuilderStatsFilterProvider>(
          create: (context) => BuilderStatsFilterProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Inter'),
        debugShowCheckedModeBanner: false,
        home: LoginWidget(),
        onGenerateRoute: AppRouter.generateRoute,
        builder: (_, child) => AppView(
          child: child!,
        ),
        navigatorKey: navKey,
      ),
    );
  }
}
