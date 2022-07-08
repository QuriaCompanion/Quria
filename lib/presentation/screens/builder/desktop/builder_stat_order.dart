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

class BuilderStatOrder extends StatelessWidget {
  const BuilderStatOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH1(
          AppLocalizations.of(context)!.builder_stats_order_title,
          utf8: false,
        ),
        textBodyHighRegular(
          AppLocalizations.of(context)!.builder_stats_order_subtitle,
          utf8: false,
        ),
        SizedBox(height: globalPadding(context)),
        Container(
          width: vw(context) - (globalPadding(context) * 2),
          padding: EdgeInsets.symmetric(horizontal: globalPadding(context) / 4, vertical: globalPadding(context) / 8),
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButton<StatWeighing>(
              underline: Container(),
              isExpanded: true,
              icon: SvgPicture.asset("assets/icons/DropIcon.svg"),
              dropdownColor: grey,
              value: Provider.of<BuilderStatsFilterProvider>(context).statWeighing,
              items: StatWeighing.values.map((StatWeighing classType) {
                return DropdownMenuItem<StatWeighing>(value: classType, child: getStatText(context, classType));
              }).toList(),
              onChanged: (StatWeighing? value) {
                if (value != null) {
                  Provider.of<BuilderStatsFilterProvider>(context, listen: false).setStatWeighing(value);
                }
              }),
        ),
        SizedBox(height: globalPadding(context)),
        Row(
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
                      child: SizedBox(height: 48, child: Center(child: textH3(i.toString()))),
                    ),
                ],
              ),
            ),
            RepaintBoundary(
              child: SizedBox(
                width: (vw(context) * 0.55 - (globalPadding(context) * 2)) * 0.95,
                height: 56 * 6,
                child: const FilterWidget(
                  color: grey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
