import 'package:flutter/material.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/models/helpers/inspectSubclassHelper.model.dart';
import 'package:quria/presentation/screens/builder/build_recap/builder_recap_page.dart';
import 'package:quria/presentation/screens/builder/builder_results/builder_results_page.dart';
import 'package:quria/presentation/screens/builder/class_item_choice/class_item_choice_page.dart';
import 'package:quria/presentation/screens/builder/exotic/exotic_page.dart';
import 'package:quria/presentation/screens/builder/mods/mods_page.dart';
import 'package:quria/presentation/screens/builder/stats_filter/stats_filter_page.dart';
import 'package:quria/presentation/screens/builder/subclass/subclass_page.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_page.dart';
import 'package:quria/presentation/screens/builds/create/create_build_page.dart';
import 'package:quria/presentation/screens/builds/details/details_build_page.dart';
import 'package:quria/presentation/screens/builds/list/list_build_page.dart';
import 'package:quria/presentation/screens/collection/collection_item/collection_item_page.dart';
import 'package:quria/presentation/screens/collection/collection_weapon_page.dart';

import 'package:quria/presentation/screens/inspect/inspect_mobile.dart';
import 'package:quria/presentation/screens/inspect_subclass/inspect_subclass_page.dart';
import 'package:quria/presentation/screens/legends/legends_page.dart';
import 'package:quria/presentation/screens/login.dart';
import 'package:quria/presentation/screens/profile/profile_page.dart';
import 'package:quria/presentation/screens/settings/settings_page.dart';
import 'package:quria/presentation/screens/vault/vault_page.dart';
import 'package:quria/presentation/var/routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeLogin:
        return MaterialPageRoute(builder: (_) => LoginWidget());
      case routeProfile:
        return MaterialPageRoute(builder: (_) => const ProfileWidget());
      case routeInspectMobile:
        return MaterialPageRoute(builder: (_) => const MobileInspect());
      case routeVault:
        return MaterialPageRoute(builder: (_) => const VaultPage());
      case routeCollection:
        return MaterialPageRoute(builder: (_) => const CollectionWeaponPage());
      case routeInspectSubclass:
        final InspectSubclassHelper data = settings.arguments as InspectSubclassHelper;
        return MaterialPageRoute(builder: (_) => InspectSubclassPage(data: data));
      case routePageSettings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case routePageLegends:
        return MaterialPageRoute(builder: (_) => const LegendsPage());
      case routeCollectionItem:
        final int data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => CollectionItemPage(itemHash: data));

      // BUILDER
      // exotic
      case routeExotic:
        return MaterialPageRoute(builder: (_) => const ExoticWidget());
      // stats filter
      case routeFilter:
        return MaterialPageRoute(builder: (_) => const StatsFilterPage());
      // subclass choice
      case routeSubclass:
        return MaterialPageRoute(builder: (_) => const SubclassPage());
      // subclass mods
      case routeSubclassMod:
        return MaterialPageRoute(builder: (_) => const SubclassModsPage());
      // class item choice
      case routeClassItemChoice:
        return MaterialPageRoute(builder: (_) => const ClassItemChoicePage());
      //armor mods
      case routeMod:
        return MaterialPageRoute(builder: (_) => const ModsPage());
      // builder Results
      case routeBuilder:
        return MaterialPageRoute(builder: (_) => const BuilderResultsPage());
      // builder Recap
      case routeBuilderRecap:
        final Build data = settings.arguments as Build;
        return MaterialPageRoute(builder: (_) => BuilderRecapPage(data: data));

      case routeCreateBuild:
        return MaterialPageRoute(builder: (_) => const CreateBuildPage());

      case routeListBuilds:
        return MaterialPageRoute(builder: (_) => const ListBuildPage());

      case routeDetailsBuild:
        return MaterialPageRoute(builder: (_) => const DetailsBuildPage());

      default:
        return MaterialPageRoute(builder: (_) => const CollectionWeaponPage());
      // return MaterialPageRoute(builder: (_) => LoginWidget());
    }
  }
}
