import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/presentation/screens/builder/components/filter.dart';

class StatsFilterMobileView extends StatefulWidget {
  final int exoticHash;
  final List<FilterHelper> filters;
  final Function(List<FilterHelper>) onFilterChanged;
  const StatsFilterMobileView(
      {required this.exoticHash,
      required this.filters,
      required this.onFilterChanged,
      Key? key})
      : super(key: key);

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
                    "Classe les statistiques par ordre de preference."),
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
                            height: 48,
                            child: Center(child: textH3(i.toString()))),
                      ),
                  ],
                ),
              ),
              SizedBox(
                  width: vw(context) * 0.8,
                  height: 400,
                  child: FilterWidget(
                    items: widget.filters,
                    onFilterChanged: (list) {
                      widget.onFilterChanged(list);
                    },
                    width: vw(context) * 0.8,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
