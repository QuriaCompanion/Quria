import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/presentation/var/routes.dart';
import 'components/nav_item.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);
  @override
  NavBarWidgetState createState() => NavBarWidgetState();
}

class NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          NavigationItem(
            title: AppLocalizations.of(context)!.collections,
            routeName: routeCollection,
          ),
          NavigationItem(
            title: AppLocalizations.of(context)!.profile,
            routeName: routeProfile,
          ),
          NavigationItem(
            title: AppLocalizations.of(context)!.builder,
            routeName: routeExotic,
          ),
          NavigationItem(
            title: AppLocalizations.of(context)!.builder_list,
            routeName: routeBuilderList,
          ),
        ],
      ),
    );
  }
}
