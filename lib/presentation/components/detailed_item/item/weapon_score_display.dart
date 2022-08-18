import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/RatedScore.model.dart';
import 'package:quria/data/models/WeaponScore.model.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/display/weapon_score.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';

class WeaponScoreDisplay extends StatefulWidget {
  const WeaponScoreDisplay({Key? key}) : super(key: key);

  @override
  State<WeaponScoreDisplay> createState() => _WeaponScoreDisplayState();
}

class _WeaponScoreDisplayState extends State<WeaponScoreDisplay> {
  late Future<WeaponScore?> _future;
  @override
  void initState() {
    super.initState();
    _future =
        WeaponScoreService().getWeaponScore('${Provider.of<InspectProvider>(context, listen: false).itemDef?.hash}');
    _future.then((value) => Provider.of<InspectProvider>(context, listen: false).setWeaponScore(value));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: ((context, AsyncSnapshot<WeaponScore?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final WeaponScore weaponScore = snapshot.data!;
              RatedScore? score;
              score = WeaponScoreService()
                  .getRatedScoreCollection(context, Provider.of<InspectProvider>(context).weaponStatus, weaponScore);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/pve.svg",
                            color: Colors.white,
                            width: 60,
                          ),
                          textH3('${score?.scorePve.round()}/100')
                        ],
                      ),
                      SizedBox(
                        width: globalPadding(context),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/pvp.svg",
                            color: Colors.white,
                            width: 60,
                          ),
                          textH3('${score?.scorePvp.round()}/100')
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: globalPadding(context),
                  ),
                  textBodyRegular('${weaponScore.notes}', utf8: false, color: greyLight),
                  textBodyBold('- ${weaponScore.author}', utf8: false, color: greyLight),
                ],
              );
            } else {
              return textH3("noScore");
            }
          } else {
            return const Loader();
          }
        }));
  }
}
