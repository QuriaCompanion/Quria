import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/RatedScore.model.dart';

class WeaponRatedScoreDisplay extends StatelessWidget {
  final RatedScore ratedScore;
  const WeaponRatedScoreDisplay({
    required this.ratedScore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color pveColor = Colors.white;
    Color pvpColor = Colors.white;
    if (ratedScore.scorePve < 30) pveColor = Colors.red;
    if (ratedScore.scorePvp < 30) pvpColor = Colors.red;

    if (ratedScore.scorePve > 70) pveColor = yellow;
    if (ratedScore.scorePvp > 70) pvpColor = yellow;

    return Container(
      decoration: const BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      height: 56 + globalPadding(context) * 2,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isMobile(context)) Container(),
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/pve.svg",
                      color: Colors.white,
                      width: 60,
                    ),
                    Row(
                      children: [textH3('${ratedScore.scorePve.round()}', color: pveColor), textCaptionBold('/100')],
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/pvp.svg",
                      color: Colors.white,
                      width: 60,
                    ),
                    Row(
                      children: [textH3('${ratedScore.scorePvp.round()}', color: pvpColor), textCaptionBold('/100')],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
