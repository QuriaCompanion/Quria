import 'package:bungie_api/helpers/bungie_net_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quria/data/services/auth.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/app.dart';
import 'package:quria/presentation/router.dart';
import 'package:quria/presentation/var/routes.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final AuthService auth = AuthService();
  BungieNetToken token = {
    'accessToken':
        'CMraAxKGAgAg7dI+0TkMGh2uh5L3BF4tvx/zOmVisBiea6PBQf/lm4zgAAAAnCkNEwBf6Lsvtc6BbSSDmCObyW6vaLiISD453n7Fyy9nbQxiCwK5DqyxBCbsyjiEGe1OZBkiDKwQ345UObPGivziNHHOFaSo9tele6rSu8WqILkkfajnmABN5W3/VNHfkauDmocu4IPBa7ObnHwCQhJ3X0cshmisE+M5UqisIYy3ppOrfHqGnNxxsX5/P1LsjR0Vc8cd1W6eaDZoSAOHlMedKs/XkwIYPOUFcDQChqWk1JdxFaVJ/ycQCG641FDdnS6qfikNvgC6vwaZm6JkkxcrmBQMHNpcr40Z+IJ5oOo=',
    'refreshToken':
        'CMraAxKGAgAgQpzRp7QWUtRVShDD4ebDYWnMQVHHWl1dnZevpWwv6XPgAAAAyHZqrwzy3ymqmzQAKZY5kqYBEtfU1BPAJq19gbF486zsq+lWy3CfAwnra/Gpfg6TkjFonIaYpdbSFLdZ/ij+JWsiRefHapizhxjmztiCB2ML8mnhwMYu6Fnm0bOhkjvIq6kKuEkSR0b5Tk0UcvG/x+wPxWjQvBkakujHmzKaraUa+++wU/YuCP6ZuV9p60tXRS8s4PGKAV3RKHSppsC/pxYHs00lShOd/EJcA5jeCwC6pBFdbUv7mOuTaK4Nk/aQkCzuKJSI5GnawJCMw/VXkwHBAWwb9svUsIBOygOXO0o=',
    'expiration': 3600,
    'membershipId': '11319478',
    'refreshTokenExpireIn': 3600,
  } as BungieNetToken;
  await auth.saveToken(token);

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
      onGenerateRoute: AppRouter.generateRoute,
      builder: (_, child) => AppView(
        child: child!,
      ),
      initialRoute: routeLogin,
      navigatorKey: navKey,
    );
  }
}
