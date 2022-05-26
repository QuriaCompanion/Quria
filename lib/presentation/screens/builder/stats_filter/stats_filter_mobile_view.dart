import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/screens/builder/components/filter.dart';

class StatsFilterMobileView extends StatefulWidget {
  const StatsFilterMobileView({Key? key}) : super(key: key);

  @override
  State<StatsFilterMobileView> createState() => _StatsFilterMobileViewState();
}

class _StatsFilterMobileViewState extends State<StatsFilterMobileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(context,
            image: statisticHeader,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textH1("Priorise tes statistiques"),
                textBodyRegular(
                  "Classe les statistiques par ordre de préférence.",
                  utf8: false,
                ),
              ],
            )),
        Padding(
          padding: EdgeInsets.all(globalPadding(context)),
          child: Container(
            padding:
                EdgeInsets.symmetric(vertical: globalPadding(context)) * 0.875,
            decoration: const BoxDecoration(
                color: blackLight,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            width: double.infinity,
            child: Center(
              child: textCaption(
                "Maintenez puis faites glisser changer l'ordre",
                utf8: false,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: globalPadding(context),
                child: Column(
                  children: [
                    for (int i = 1; i <= 6; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SizedBox(
                            height: 48,
                            child: Center(child: textH3(i.toString()))),
                      ),
                  ],
                ),
              ),
              RepaintBoundary(
                child: SizedBox(
                  width: vw(context) * 0.8,
                  height: 56 * 6,
                  child: const FilterWidget(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: globalPadding(context) * 4,
        )
      ],
    );
  }
}
