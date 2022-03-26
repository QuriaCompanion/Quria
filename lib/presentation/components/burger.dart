import 'package:bungie_api/models/user_membership_data.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/components/misc/loader.dart';

class Burger extends StatefulWidget {
  const Burger({Key? key}) : super(key: key);

  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  late Future<UserMembershipData?> _future;

  @override
  void initState() {
    super.initState();
    _future = AccountService().getMembershipData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot<UserMembershipData?> snapshot) {
          if (snapshot.hasData) {
            return Container(
              decoration: const BoxDecoration(color: black),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.58,
                    height: (MediaQuery.of(context).size.width * 0.58) * 0.74,
                    padding: EdgeInsets.all(globalPadding(context)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(
                              '${DestinyData.bungieLink}/img/UserThemes/${snapshot.data?.bungieNetUser?.profileThemeName}/header.jpg')),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width:
                              (MediaQuery.of(context).size.width * 0.58) * 0.22,
                          height:
                              (MediaQuery.of(context).size.width * 0.58) * 0.22,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    '${DestinyData.bungieLink}${snapshot.data?.bungieNetUser?.profilePicturePath}')),
                          ),
                        ),
                        const SizedBox(height: 16),
                        textH2(snapshot.data!.bungieNetUser!.uniqueName!)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        ((MediaQuery.of(context).size.width * 0.58) * 0.74) -
                        globalPadding(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.58,
                          padding: EdgeInsets.all(globalPadding(context)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  const Icon(Icons.person_outline_outlined,
                                      color: Colors.white),
                                  const SizedBox(width: 18),
                                  textBodyHighRegular("Personnage"),
                                ],
                              ),
                              const SizedBox(height: 32),
                              Row(
                                children: [
                                  const Icon(Icons.star_border,
                                      color: Colors.white),
                                  const SizedBox(width: 18),
                                  textBodyHighRegular("Builds"),
                                ],
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
                          width: MediaQuery.of(context).size.width * 0.58,
                          padding: EdgeInsets.only(
                              left: globalPadding(context),
                              right: globalPadding(context),
                              bottom: globalPadding(context)),
                          child: Row(
                            children: [
                              const Icon(Icons.power_settings_new,
                                  color: Colors.white),
                              const SizedBox(width: 18),
                              textBodyHighRegular("DÃ©connexion"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Loader();
        });
  }
}
