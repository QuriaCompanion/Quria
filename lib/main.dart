import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/providers/builder/builder_custom_info_provider.dart';
import 'package:quria/data/providers/builder/builder_exotic_provider.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_stats_filter_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/collectible_provider.dart';
import 'package:quria/data/providers/inspect/armor_mod_modal_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/providers/language_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quria/data/providers/plugs_provider.dart';
import 'package:quria/presentation/screens/inspect/components/armor_mod_desktop_modal.dart';
import 'package:universal_io/io.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/app.dart';
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
  if (kIsWeb || !Platform.isWindows) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  }

  runApp(QuriaApp(router: AppRouter(), lang: lang));
}

class QuriaApp extends StatelessWidget {
  final AppRouter router;
  final Locale? lang;

  const QuriaApp({Key? key, required this.router, required this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ArmorModModalProvider>(
            create: (context) => ArmorModModalProvider(),
          ),
          ChangeNotifierProvider<BuilderExoticProvider>(
            create: (context) => BuilderExoticProvider(),
          ),
          ChangeNotifierProvider<InspectProvider>(
            create: (context) => InspectProvider(),
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
          ChangeNotifierProvider<BuilderCustomInfoProvider>(
            create: (context) => BuilderCustomInfoProvider(),
          ),
          ChangeNotifierProvider<BuilderModsProvider>(
            create: (context) => BuilderModsProvider(),
          ),
          ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider(),
          ),
          ChangeNotifierProvider<InventoryProvider>(
            create: (context) => InventoryProvider(),
          ),
          ChangeNotifierProvider<ItemProvider>(
            create: (context) => ItemProvider(),
          ),
          ChangeNotifierProvider<PlugsProvider>(
            create: (context) => PlugsProvider(),
          ),
          ChangeNotifierProvider<CollectibleProvider>(
            create: (context) => CollectibleProvider(),
          ),
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
