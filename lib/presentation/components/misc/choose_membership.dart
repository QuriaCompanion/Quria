import 'package:bungie_api/enums/bungie_membership_type.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

class ChooseMembership extends StatelessWidget {
  final List<GroupUserInfoCard?> memberships;
  final void Function(String) onSelected;
  const ChooseMembership(
      {required this.memberships, required this.onSelected, Key? key})
      : super(key: key);

  String membershipName(GroupUserInfoCard membership) {
    switch (membership.membershipType) {
      case BungieMembershipType.TigerXbox:
        return 'Xbox';
      case BungieMembershipType.TigerPsn:
        return 'PSN';
      case BungieMembershipType.TigerBlizzard:
        return 'Blizzard';
      case BungieMembershipType.TigerSteam:
        return 'Steam';
      case BungieMembershipType.TigerStadia:
        return 'Stadia';
      default:
        return 'Iconnue';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: blackLight,
        ),
        width: vw(context) * 0.5,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: globalPadding(context) * 2),
              child: Text(
                AppLocalizations.of(context)!.choose_membership,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                for (GroupUserInfoCard? membership in memberships)
                  Container(
                    margin: EdgeInsets.only(top: globalPadding(context)),
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: vw(context) * .2,
                    width: vw(context) * .8,
                    child: InkWell(
                      onTap: () {
                        onSelected(membership!.membershipId!);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (membership?.membershipType ==
                              membership?.crossSaveOverride)
                            Image.network(
                              "https://www.bungie.net/7/ca/destiny/logos/crossSave.png",
                              height: vw(context) * .1,
                            ),
                          Text(
                            membershipName(membership!),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
