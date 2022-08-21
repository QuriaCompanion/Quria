import 'package:bungie_api/enums/bungie_membership_type.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class ChooseMembership extends StatelessWidget {
  final List<GroupUserInfoCard?> memberships;
  final void Function(String) onSelected;
  const ChooseMembership({required this.memberships, required this.onSelected, Key? key}) : super(key: key);

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
    return Container(
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(10),
      ),
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
          ListView(
            shrinkWrap: true,
            children: [
              for (GroupUserInfoCard? membership in memberships)
                Column(
                  children: [
                    ListTile(
                      onTap: () {
                        onSelected(membership!.membershipId!);
                      },
                      leading: Builder(builder: (context) {
                        if (membership?.crossSaveOverride == membership?.membershipType) {
                          return SizedBox(
                            child: Image.asset(
                              "assets/img/crossSave.png",
                              width: 35,
                              height: 35,
                              colorBlendMode: BlendMode.clear,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                      title: textBodyBold(
                        membershipName(membership!),
                      ),
                    ),
                    const Divider(color: Colors.white)
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
