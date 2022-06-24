import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/StatWeighing.enum.dart';
import 'package:quria/data/providers/builder/builder_stats_filter_provider.dart';
import 'package:quria/presentation/screens/builder/components/filter.dart';

class StatsFilterMobileView extends StatefulWidget {
  const StatsFilterMobileView({Key? key}) : super(key: key);

  @override
  State<StatsFilterMobileView> createState() => _StatsFilterMobileViewState();
}

class _StatsFilterMobileViewState extends State<StatsFilterMobileView> {
  Widget _getStatText(StatWeighing statWeighing) {
    switch (statWeighing) {
      case StatWeighing.allTiers:
        return textBodyMedium(
            AppLocalizations.of(context)!.builder_stats_order_all_tiers);
      case StatWeighing.maxOne:
        return textBodyMedium(
            AppLocalizations.of(context)!.builder_stats_order_tier_1);
      case StatWeighing.maxTwo:
        return textBodyMedium(
            AppLocalizations.of(context)!.builder_stats_order_tier_2);
      case StatWeighing.maxThree:
        return textBodyMedium(
            AppLocalizations.of(context)!.builder_stats_order_tier_3);
    }
  }

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
                textH1(
                  AppLocalizations.of(context)!.builder_stats_order_title,
                  utf8: false,
                ),
                textBodyRegular(
                  AppLocalizations.of(context)!.builder_stats_order_subtitle,
                  utf8: false,
                ),
              ],
            )),
        Column(
          children: [
            Container(
              width: vw(context) - (globalPadding(context) * 2),
              padding: EdgeInsets.symmetric(
                  horizontal: globalPadding(context),
                  vertical: globalPadding(context) / 4),
              decoration: BoxDecoration(
                color: blackLight,
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<StatWeighing>(
                  underline: Container(),
                  isExpanded: true,
                  icon: SvgPicture.asset("assets/icons/DropIcon.svg"),
                  dropdownColor: blackLight,
                  value: Provider.of<BuilderStatsFilterProvider>(context)
                      .statWeighing,
                  items: StatWeighing.values.map((StatWeighing classType) {
                    return DropdownMenuItem<StatWeighing>(
                        value: classType, child: _getStatText(classType));
                  }).toList(),
                  onChanged: (StatWeighing? value) {
                    if (value != null) {
                      Provider.of<BuilderStatsFilterProvider>(context,
                              listen: false)
                          .setStatWeighing(value);
                    }
                  }),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(globalPadding(context)),
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
