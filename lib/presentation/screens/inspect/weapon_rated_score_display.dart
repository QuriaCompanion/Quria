import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/RatedScore.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/display/weapon_score.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';

class WeaponRatedScoreDisplay extends ConsumerWidget {
  const WeaponRatedScoreDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color pveColor = Colors.white;
    Color pvpColor = Colors.white;
    AsyncValue<RatedScore?> ratedScore = ref.watch(
      ratedScoreProvider(
        ref.watch(inspectProvider.select((value) => value?.item)),
      ),
    );
    return ratedScore.when(data: (ratedScore) {
      if (ratedScore != null) {
        if (ratedScore.scorePve < 30) pveColor = crucible;
        if (ratedScore.scorePvp < 30) pvpColor = crucible;

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
                          children: [
                            textH3('${ratedScore.scorePve.round()}', color: pveColor),
                            textCaptionBold('/100')
                          ],
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
                          children: [
                            textH3('${ratedScore.scorePvp.round()}', color: pvpColor),
                            textCaptionBold('/100')
                          ],
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
      return Container();
    }, error: (_, __) {
      return Container();
    }, loading: () {
      return Container(
        decoration: const BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        height: 56 + globalPadding(context) * 2,
        child: const Center(
          child: Loader(),
        ),
      );
    });
  }
}
