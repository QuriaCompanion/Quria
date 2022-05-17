import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
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
                    utf8: false),
              ],
            )),
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
                            height: 35 + globalPadding(context),
                            child: Center(child: textH3(i.toString()))),
                      ),
                  ],
                ),
              ),
              RepaintBoundary(
                child: SizedBox(
                  width: vw(context) * 0.8,
                  height: (43 + globalPadding(context)) * 6,
                  child: FilterWidget(),
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
