import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/presentation/screens/builder/builder.dart';
import 'package:quria/presentation/screens/builder/exotic.dart';
import 'package:quria/presentation/screens/builder/stats_filter.dart';
import 'package:quria/presentation/screens/collection/collection.dart';
import 'package:quria/presentation/screens/inspect/inspect.dart';
import 'package:quria/presentation/screens/login.dart';
import 'package:quria/presentation/screens/profile/profile.dart';
import 'package:quria/presentation/var/routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeLogin:
        return MaterialPageRoute(builder: (_) => LoginWidget());
      case routeProfile:
        return MaterialPageRoute(builder: (_) => const ProfileWidget());
      case routeFilter:
        final int exoticHash = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => StatsFilterWidget(exoticHash: exoticHash));
      case routeBuilder:
        final BuilderPreparation data =
            settings.arguments as BuilderPreparation;
        return MaterialPageRoute(builder: (_) => BuilderWidget(data: data));
      case routeExotic:
        return MaterialPageRoute(builder: (_) => const ExoticWidget());
      case routeCollection:
        return MaterialPageRoute(builder: (_) => const CollectionWidget());
      case routeInspect:
        final DestinyInventoryItemDefinition item =
            settings.arguments as DestinyInventoryItemDefinition;
        return MaterialPageRoute(builder: (_) => InspectWidget(item: item));
      default:
        return MaterialPageRoute(builder: (_) => LoginWidget());
    }
  }
}
