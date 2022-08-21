import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/var/routes.dart';

class Burger extends StatefulWidget {
  const Burger({Key? key}) : super(key: key);

  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: black),
      child: Column(
        children: [
          Container(
            width: vw(context) * 0.58,
            height: (vw(context) * 0.58) * 0.74,
            padding: EdgeInsets.all(globalPadding(context)),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      '${DestinyData.bungieLink}/img/UserThemes/${AccountService.membershipData?.bungieNetUser?.profileThemeName}/header.jpg?t={${Random().nextInt(100)}}123456')),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: (vw(context) * 0.58) * 0.22,
                  height: (vw(context) * 0.58) * 0.22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            '${DestinyData.bungieLink}${AccountService.membershipData?.bungieNetUser?.profilePicturePath}?t={${Random().nextInt(100)}}123456')),
                  ),
                ),
                const SizedBox(height: 16),
                textH2(
                  AccountService.membershipData?.bungieNetUser?.uniqueName ?? "an error has occured",
                  utf8: false,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - ((vw(context) * 0.58) * 0.74) - globalPadding(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: vw(context) * 0.58,
                  padding: EdgeInsets.all(globalPadding(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 24),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, routeProfile);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/Perso-1.svg"),
                            const SizedBox(width: 18),
                            textBodyHighRegular(AppLocalizations.of(context)!.character, utf8: false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, routeExotic);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/Quria.svg"),
                            const SizedBox(width: 18),
                            textBodyHighRegular(AppLocalizations.of(context)!.quria_builder, utf8: false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, routeListBuilds);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/Builds.svg"),
                            const SizedBox(width: 18),
                            textBodyHighRegular(AppLocalizations.of(context)!.builds, utf8: false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, routeVault);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/Coffre.svg"),
                            const SizedBox(width: 18),
                            textBodyHighRegular(AppLocalizations.of(context)!.vault, utf8: false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, routeCollection);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/Collection.svg"),
                            const SizedBox(width: 18),
                            textBodyHighRegular(AppLocalizations.of(context)!.collections, utf8: false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, routePageSettings);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/Settings.svg"),
                            const SizedBox(width: 18),
                            textBodyHighRegular(
                              AppLocalizations.of(context)!.settings,
                              utf8: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: vw(context) * 0.58,
                  padding: EdgeInsets.only(
                      left: globalPadding(context), right: globalPadding(context), bottom: globalPadding(context)),
                  child: InkWell(
                    onTap: () {
                      DisplayService.isProfileUp = false;
                      ProfileService.reset(context);
                      AccountService.reset();
                      Navigator.pushNamed(context, routeLogin);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/Off.svg"),
                        const SizedBox(width: 18),
                        textBodyHighRegular(AppLocalizations.of(context)!.logout, utf8: false),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
