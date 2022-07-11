import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/builder/builder_custom_info_provider.dart';
import 'package:quria/data/providers/builder/builder_exotic_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/navbar_item.dart';
import 'package:quria/presentation/components/misc/refresh_button.dart';
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
                          name: AppLocalizations.of(context)!.character,
                          route: routeProfile,
                          selected: routeProfile == widget.currentRoute,
                          icon: "assets/icons/Perso-1.svg",
                        ),
                        NavBarButton(
                          name: AppLocalizations.of(context)!.quria_builder,
                          route: routeExotic,
                          selected: routeExotic == widget.currentRoute,
                          icon: "assets/icons/Quria.svg",
                        ),
                        NavBarButton(
                          name: AppLocalizations.of(context)!.collections,
                          route: routeCollection,
                          selected: routeCollection == widget.currentRoute,
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
                                List<DestinyCharacterComponent> characters =
                                    Provider.of<CharactersProvider>(context, listen: false).characters;
                                return Center(
                                  child: Container(
                                    width: vw(context) * 0.4,
                                    decoration:
                                        BoxDecoration(color: blackLight, borderRadius: BorderRadius.circular(10)),
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
                                                  if (character.value !=
                                                      Provider.of<CharactersProvider>(context, listen: false)
                                                          .currentCharacter) {
                                                    Provider.of<CharactersProvider>(context, listen: false)
                                                        .setCurrentCharacter(character.key);
                                                    Provider.of<BuilderCustomInfoProvider>(context, listen: false)
                                                        .reset();
                                                    Provider.of<BuilderExoticProvider>(context, listen: false).reset();
                                                    Provider.of<BuilderSubclassProvider>(context, listen: false)
                                                        .reset();
                                                  }
                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Image(
                                                        width: 50,
                                                        height: 50,
                                                        image: NetworkImage(
                                                            DestinyData.bungieLink + character.value.emblemPath!)),
                                                    textBodyBold(ManifestService
                                                            .manifestParsed
                                                            .destinyClassDefinition[character.value.classHash]!
                                                            .genderedClassNamesByGenderHash![
                                                        character.value.genderHash.toString()]!),
                                                    Row(
                                                      children: [
                                                        Image(
                                                          width: 30,
                                                          height: 30,
                                                          image: NetworkImage(DestinyData.bungieLink +
                                                              ManifestService
                                                                  .manifestParsed
                                                                  .destinyStatDefinition[StatsHash.power]!
                                                                  .displayProperties!
                                                                  .icon!),
                                                          color: yellow,
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
                            character: Provider.of<CharactersProvider>(context).currentCharacter!,
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
            },
          ),
        ),
        body: SingleChildScrollView(child: widget.body));
  }
}
