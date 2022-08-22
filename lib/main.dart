import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:universal_io/io.dart';
import 'data/providers/language_notifier.dart';
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

  runApp(ProviderScope(child: QuriaApp(router: AppRouter(), lang: lang)));
}

class QuriaApp extends ConsumerWidget {
  final AppRouter router;
  final Locale? lang;

  const QuriaApp({Key? key, required this.router, required this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale? savedLang = ref.watch(languageProvider);

    return MaterialApp(
      locale: savedLang ?? lang,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
        Locale('it', ''), // Italian, no country code
        Locale('fr', ''), // French, no country code
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
  }
}
