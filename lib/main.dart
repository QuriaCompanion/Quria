import 'package:bungie_api/helpers/bungie_net_token.dart';
import 'package:bungie_api/models/destiny_class_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quria/data/services/auth.service.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/app.dart';
import 'package:quria/presentation/router.dart';
import 'package:quria/presentation/var/routes.dart';

void main() async {
  StorageService.init();
  await dotenv.load(fileName: ".env");
  final AuthService auth = AuthService();
  final AccountService account = AccountService();
  final ProfileService profile = ProfileService();
  BungieNetToken token = BungieNetToken.fromJson({
    'access_token':
        'CMraAxKGAgAg7dI+0TkMGh2uh5L3BF4tvx/zOmVisBiea6PBQf/lm4zgAAAAnCkNEwBf6Lsvtc6BbSSDmCObyW6vaLiISD453n7Fyy9nbQxiCwK5DqyxBCbsyjiEGe1OZBkiDKwQ345UObPGivziNHHOFaSo9tele6rSu8WqILkkfajnmABN5W3/VNHfkauDmocu4IPBa7ObnHwCQhJ3X0cshmisE+M5UqisIYy3ppOrfHqGnNxxsX5/P1LsjR0Vc8cd1W6eaDZoSAOHlMedKs/XkwIYPOUFcDQChqWk1JdxFaVJ/ycQCG641FDdnS6qfikNvgC6vwaZm6JkkxcrmBQMHNpcr40Z+IJ5oOo=',
    'expires_in': 3600,
    'refresh_token':
        'CMraAxKGAgAgQpzRp7QWUtRVShDD4ebDYWnMQVHHWl1dnZevpWwv6XPgAAAAyHZqrwzy3ymqmzQAKZY5kqYBEtfU1BPAJq19gbF486zsq+lWy3CfAwnra/Gpfg6TkjFonIaYpdbSFLdZ/ij+JWsiRefHapizhxjmztiCB2ML8mnhwMYu6Fnm0bOhkjvIq6kKuEkSR0b5Tk0UcvG/x+wPxWjQvBkakujHmzKaraUa+++wU/YuCP6ZuV9p60tXRS8s4PGKAV3RKHSppsC/pxYHs00lShOd/EJcA5jeCwC6pBFdbUv7mOuTaK4Nk/aQkCzuKJSI5GnawJCMw/VXkwHBAWwb9svUsIBOygOXO0o=',
    'refresh_expires_in': 3600,
    'membership_id': '11319478',
  });
  if (await auth.getToken() == null) await auth.saveToken(token);
  await account.getMembership();
  await profile.loadProfile();
  ManifestService.getManifest<DestinyInventoryItemDefinition>();
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
