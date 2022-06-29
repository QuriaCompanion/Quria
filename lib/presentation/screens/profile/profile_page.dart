import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/choose_membership.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_navbar.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_characters.dart';
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
  late Future _future;
  DestinyItemType currentFilter = DestinyItemType.Weapon;
  @override
  void initState() {
    super.initState();
    _future = DisplayService.loadManifestAndProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final characters = Provider.of<CharactersProvider>(context).characters;
            if (characters.isEmpty) {
              return Column(
                children: [
                  ErrorDialog(
                    errorMessage: AppLocalizations.of(context)!.no_characters,
                    child: ChooseMembership(
                        memberships: AccountService.membershipData!.destinyMemberships!,
                        onSelected: (membership) async {
                          AccountService.saveMembership(AccountService.membershipData!, membership).then((_) {
                            DisplayService.isProfileUp = false;
                            Navigator.pushReplacementNamed(context, routeProfile);
                          });
                        }),
                  ),
                ],
              );
            }
            ProfileHelper data = DisplayService.getProfileData(context);
            if (vw(context) > 1000) {
              return ScaffoldDesktop(
                currentRoute: routeProfile,
                body: ProfileDesktopView(
                    data: data,
                    onClick: (inspectData) {
                      Navigator.pushNamed(context, routeInspectMobile, arguments: inspectData);
                    }),
              );
            } else {
              return ScaffoldCharacters(
                body: RepaintBoundary(
                  child: ProfileMobileView(
                      data: data,
                      onClick: (inspectData) {
                        Navigator.pushNamed(context, routeInspectMobile, arguments: inspectData);
                      }),
                ),
              );
            }
          }
          return Container(
            height: vh(context),
            width: vw(context),
            decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: splashBackground)),
            child: Loader(
              splashColor: Colors.transparent,
              animationSize: vw(context) * 0.5,
            ),
          );
        }));
  }
}
