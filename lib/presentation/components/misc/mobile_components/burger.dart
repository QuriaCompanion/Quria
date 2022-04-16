import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/auth.service.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
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
                      '${DestinyData.bungieLink}/img/UserThemes/${AccountService.membershipData?.bungieNetUser?.profileThemeName}/header.jpg')),
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
                            '${DestinyData.bungieLink}${AccountService.membershipData?.bungieNetUser?.profilePicturePath}')),
                  ),
                ),
                const SizedBox(height: 16),
                textH2(
                    AccountService.membershipData?.bungieNetUser?.uniqueName ??
                        "an error has occured")
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height -
                ((vw(context) * 0.58) * 0.74) -
                globalPadding(context),
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
                            const Icon(Icons.person_outline_outlined,
                                color: Colors.white),
                            const SizedBox(width: 18),
                            textBodyHighRegular("Personnage"),
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
                            const Icon(Icons.star_border, color: Colors.white),
                            const SizedBox(width: 18),
                            textBodyHighRegular("Builds"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          const Icon(Icons.check_box_outline_blank,
                              color: Colors.white),
                          const SizedBox(width: 18),
                          textBodyHighRegular("Coffre"),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          const Icon(Icons.layers, color: Colors.white),
                          const SizedBox(width: 18),
                          textBodyHighRegular("Collections"),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          const Icon(Icons.settings_outlined,
                              color: Colors.white),
                          const SizedBox(width: 18),
                          textBodyHighRegular("ParamÃ¨tres"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: vw(context) * 0.58,
                  padding: EdgeInsets.only(
                      left: globalPadding(context),
                      right: globalPadding(context),
                      bottom: globalPadding(context)),
                  child: InkWell(
                    onTap: () {
                      AuthService().removeToken();
                      Navigator.pushNamed(context, routeLogin);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.power_settings_new,
                            color: Colors.white),
                        const SizedBox(width: 18),
                        textBodyHighRegular("DÃ©connexion"),
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
