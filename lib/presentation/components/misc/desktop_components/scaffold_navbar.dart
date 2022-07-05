import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/presentation/components/misc/desktop_components/navbar_item.dart';
import 'package:quria/presentation/screens/profile/components/character_desktop_banner_info.dart';
import 'package:quria/presentation/screens/settings/settings_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class ScaffoldDesktop extends StatefulWidget {
  final Widget body;
  final String currentRoute;

  const ScaffoldDesktop({required this.body, Key? key, required this.currentRoute}) : super(key: key);

  @override
  State<ScaffoldDesktop> createState() => _ScaffoldDesktopState();
}

class _ScaffoldDesktopState extends State<ScaffoldDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: Builder(
            builder: (context) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: globalPadding(context) / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NavBarButton(
                          name: 'Personnage',
                          route: routeProfile,
                          selected: routeProfile == widget.currentRoute,
                          icon: "assets/icons/Perso-1.svg",
                        ),
                        NavBarButton(
                          name: 'QuriaBuilder',
                          route: routeExotic,
                          selected: routeExotic == widget.currentRoute,
                          icon: "assets/icons/Quria.svg",
                        ),
                        NavBarButton(
                          name: 'Collections',
                          route: routeCollection,
                          selected: routeCollection == widget.currentRoute,
                          icon: "assets/icons/Collection.svg",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CharacterDesktopBannerInfo(
                          character: Provider.of<CharactersProvider>(context).currentCharacter!,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierColor: const Color.fromARGB(110, 0, 0, 0),
                              builder: (context) {
                                return desktopItemModal(
                                  context,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: blackLight),
                                    child: Column(
                                      children: [
                                        textH2('Paramètres', utf8: false),
                                        const SettingsMobileView(
                                          height: 600,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset("assets/icons/Settings.svg"),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(child: widget.body));
  }
}
