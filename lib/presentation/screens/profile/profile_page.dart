import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/itemInfoHelper.model.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/choose_membership.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_characters.dart';
import 'package:quria/presentation/screens/inspect/inspect_item.dart';
import 'package:quria/presentation/screens/profile/profile_desktop_view.dart';
import 'package:quria/presentation/screens/profile/profile_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

@immutable
class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final display = DisplayService();
  late ProfileHelper data;
  late Future _future;
  DestinyItemType currentFilter = DestinyItemType.Weapon;
  @override
  void initState() {
    super.initState();
    _future = DisplayService.loadManifestAndProfile();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            int currentIndex =
                Provider.of<CharactersProvider>(context).characterIndex;
            data = display.getProfileData(currentIndex);
            // set current character to provider

            if (data.characters.isEmpty) {
              return Column(
                children: [
                  ErrorDialog(
                    errorMessage: AppLocalizations.of(context)!.no_characters,
                    child: ChooseMembership(
                        memberships:
                            AccountService.membershipData!.destinyMemberships!,
                        onSelected: (membership) async {
                          AccountService()
                              .saveMembership(
                                  AccountService.membershipData!, membership)
                              .then((_) {
                            DisplayService.isProfileUp = false;
                            Navigator.pushReplacementNamed(
                                context, routeProfile);
                          });
                        }),
                  ),
                ],
              );
            }
            Provider.of<CharactersProvider>(context, listen: false)
                .init(data.selectedCharacter!, data.characters);
            if (vw(context) > 1000) {
              return Scaffold(
                backgroundColor: black,
                body: SingleChildScrollView(
                  child: ProfileDesktopView(
                      data: data,
                      onClick: (inspectData) {
                        final ItemInfoHelper data = DisplayService()
                            .getItemInfo(
                                inspectData.instanceId, inspectData.hash);
                        showDialog(
                            context: context,
                            barrierColor: const Color.fromARGB(110, 0, 0, 0),
                            builder: (context) {
                              return desktopModal(context,
                                  child: InspectItem(
                                    inspectData: inspectData,
                                    data: data,
                                    width: vw(context) * 0.4,
                                  ));
                            });
                      }),
                ),
              );
            } else {
              return ScaffoldCharacters(
                characters: data.characters,
                // give a function parameter to the child which is executed in the parent
                onCharacterChange: (newIndex) {
                  setState(() {
                    Provider.of<CharactersProvider>(context, listen: false)
                        .setCurrentCharacter(newIndex);
                  });
                },
                body: RepaintBoundary(
                  child: ProfileMobileView(
                      data: data,
                      onClick: (inspectData) {
                        Navigator.pushNamed(context, routeInspectMobile,
                                arguments: inspectData)
                            .then((_) => setState(() {}));
                      }),
                ),
              );
            }
          }
          return Container(
            height: vh(context),
            width: vw(context),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: splashBackground)),
            child: Loader(
              splashColor: Colors.transparent,
              animationSize: vw(context) * 0.5,
            ),
          );
        }));
  }
}
