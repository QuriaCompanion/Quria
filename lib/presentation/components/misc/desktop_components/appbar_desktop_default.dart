import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/navbar_item.dart';
import 'package:quria/presentation/components/misc/refresh_button.dart';
import 'package:quria/presentation/screens/profile/components/character_desktop_banner_info.dart';
import 'package:quria/presentation/screens/settings/settings_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class AppbarDesktopDefault extends ConsumerWidget {
  final String currentRoute;
  const AppbarDesktopDefault({Key? key, required this.currentRoute}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: vw(context),
      padding: EdgeInsets.symmetric(horizontal: globalPadding(context) / 2),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavBarButton(
                name: AppLocalizations.of(context)!.character,
                route: routeProfile,
                selected: routeProfile == currentRoute,
                icon: "assets/icons/Perso-1.svg",
              ),
              NavBarButton(
                name: AppLocalizations.of(context)!.quria_builder,
                route: routeExotic,
                selected: routeExotic == currentRoute,
                icon: "assets/icons/Quria.svg",
              ),
              NavBarButton(
                name: AppLocalizations.of(context)!.builds,
                route: routeListBuilds,
                selected: routeListBuilds == currentRoute,
                icon: "assets/icons/Builds.svg",
              ),
              NavBarButton(
                name: AppLocalizations.of(context)!.collections,
                route: routeCollection,
                selected: routeCollection == currentRoute,
                icon: "assets/icons/Collection.svg",
              ),
            ],
          ),
          Row(
            children: [
              const RefreshButton(),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      List<DestinyCharacterComponent> characters = ref.watch(charactersProvider);
                      return Center(
                        child: Container(
                          width: vw(context) * 0.4,
                          decoration: BoxDecoration(color: blackLight, borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(globalPadding(context)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textH2(AppLocalizations.of(context)!.character, utf8: false),
                                    InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.clear, size: 20, color: black),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: greyLight,
                                  thickness: 2,
                                ),
                                for (var character in characters.asMap().entries)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: InkWell(
                                      onTap: () {
                                        if (character.value != characters.first) {
                                          ref.read(builderQuriaProvider.notifier).reset();
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                              width: 50,
                                              height: 50,
                                              filterQuality: FilterQuality.high,
                                              image: CachedNetworkImageProvider(
                                                  DestinyData.bungieLink + character.value.emblemPath!)),
                                          textBodyBold(ManifestService
                                              .manifestParsed
                                              .destinyClassDefinition[character.value.classHash]!
                                              .genderedClassNamesByGenderHash![character.value.genderHash.toString()]!),
                                          Row(
                                            children: [
                                              Image(
                                                width: 30,
                                                height: 30,
                                                image: CachedNetworkImageProvider(DestinyData.bungieLink +
                                                    ManifestService
                                                        .manifestParsed
                                                        .destinyStatDefinition[StatsHash.power]!
                                                        .displayProperties!
                                                        .icon!),
                                                color: yellow,
                                                filterQuality: FilterQuality.high,
                                                fit: BoxFit.cover,
                                              ),
                                              textBodyBold(character.value.light.toString(), color: yellow),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: CharacterDesktopBannerInfo(
                  character: ref.watch(charactersProvider).first,
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: const Color.fromARGB(110, 0, 0, 0),
                    builder: (context) {
                      return Center(
                        child: Container(
                          width: vw(context) * 0.4,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: blackLight,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textH1(AppLocalizations.of(context)!.settings, utf8: false),
                                    InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.clear, size: 20, color: black),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: greyLight,
                                  thickness: 2,
                                ),
                                const SettingsMobileView(
                                  height: 600,
                                ),
                              ],
                            ),
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
  }
}
