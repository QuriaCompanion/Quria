import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/providers/builder/builder_class_item_provider.dart';
import 'package:quria/data/providers/builder/builder_exotic_provider.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_stats_filter_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/language_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:universal_io/io.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/app.dart';
import 'package:quria/presentation/router.dart';
import 'package:quria/presentation/screens/login.dart';
import 'package:quria/presentation/var/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageService.init();
  String? storedLang = await StorageService.getLocalStorage<String?>('lang');
  Locale? lang;
  if (storedLang != null) {
    lang = Locale.fromSubtags(languageCode: storedLang);
  }
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(QuriaApp(router: AppRouter(), lang: lang));
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
}

class QuriaApp extends StatelessWidget {
  final AppRouter router;
  final Locale? lang;

  const QuriaApp({Key? key, required this.router, required this.lang})
      : super(key: key);

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
          ChangeNotifierProvider<BuilderSubclassProvider>(
            create: (context) => BuilderSubclassProvider(),
          ),
          ChangeNotifierProvider<BuilderSubclassModsProvider>(
            create: (context) => BuilderSubclassModsProvider(),
          ),
          ChangeNotifierProvider<CharactersProvider>(
            create: (context) => CharactersProvider(),
          ),
          ChangeNotifierProvider<BuilderClassItemProvider>(
            create: (context) => BuilderClassItemProvider(),
          ),
          ChangeNotifierProvider<BuilderModsProvider>(
            create: (context) => BuilderModsProvider(),
          ),
          ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider(),
          )
        ],
        builder: (context, child) {
          final currentLang = Provider.of<LanguageProvider>(context).language ??
              lang ??
              Locale(Platform.localeName.substring(0, 2), '');
          return MaterialApp(
            locale: currentLang,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
              Locale('es', ''), // Spanish, no country code
              Locale('fr', ''),
            ],
            theme: ThemeData(fontFamily: 'Inter'),
            debugShowCheckedModeBanner: false,
            home: LoginWidget(),
            onGenerateRoute: AppRouter.generateRoute,
            builder: (_, child) => AppView(
              child: child!,
            ),
            navigatorKey: navKey,
          );
        });
  }
}
