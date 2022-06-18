import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class ArmorAfinity extends StatelessWidget {
  final String afinityIcon;
  final int pointsAvailable;
  final int remaining;
  final double width;
  const ArmorAfinity({
    required this.afinityIcon,
    required this.pointsAvailable,
    required this.remaining,
    required this.width,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: itemSize(context, width),
            decoration: const BoxDecoration(
                color: solar,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                          width: 18,
                          height: 18,
                          image: NetworkImage(
                              DestinyData.bungieLink + afinityIcon)),
                      SizedBox(
                          width: (vw(context) - (globalPadding(context) * 2)) *
                              0.005),
                      textH2(pointsAvailable.toString()),
                    ],
                  ),
                  textBodyRegular(
                      '${AppLocalizations.of(context)!.unused}: $remaining',
                      utf8: false),
                ],
              ),
            )),
        SizedBox(height: (vw(context) - (globalPadding(context) * 2)) * 0.005),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: itemSize(context, width) / 3,
              width: (vw(context) - (globalPadding(context) * 2)) / 10.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
              ),
            ),
            for (int i = 2; i < 10; i++)
              Container(
                height: itemSize(context, width) / 3,
                width: (vw(context) - (globalPadding(context) * 2)) / 10.5,
                decoration: BoxDecoration(
                  color: pointsAvailable >= i ? Colors.white : greyLight,
                ),
              ),
            Container(
              height: itemSize(context, width) / 3,
              width: (vw(context) - (globalPadding(context) * 2)) / 10.5,
              decoration: BoxDecoration(
                color: pointsAvailable == 10 ? Colors.white : greyLight,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(8)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
