import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/choose_membership.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_searchbar_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_characters.dart';
import 'package:quria/presentation/components/misc/page_loader.dart';
import 'package:quria/presentation/screens/profile/profile_desktop_view.dart';
import 'package:quria/presentation/screens/profile/profile_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

@immutable
class ProfileWidget extends ConsumerStatefulWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  ProfileWidgetState createState() => ProfileWidgetState();
}

class ProfileWidgetState extends ConsumerState<ProfileWidget> {
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
          final characters = ref.watch(charactersProvider);
          if (characters.isEmpty) {
            return Column(
              children: [
                ChooseMembership(
                  memberships: AccountService.membershipData!.destinyMemberships!,
                  onSelected: (membership) async {
                    AccountService.saveMembership(AccountService.membershipData!, membership).then(
                      (_) {
                        DisplayService.isProfileUp = false;
                        Navigator.pushReplacementNamed(context, routeProfile);
                      },
                    );
                  },
                ),
              ],
            );
          }
          ProfileHelper data = DisplayService.getProfileData(context);
          if (vw(context) > 1000) {
            return ScaffoldSearchbarDesktop(
                currentRoute: routeProfile,
                body: ProfileDesktopView(
                  data: data,
                ));
          } else {
            return ScaffoldCharacters(
                body: RepaintBoundary(
              child: ProfileMobileView(
                data: data,
              ),
            ));
          }
        }
        return const PageLoader();
      }),
    );
  }
}
