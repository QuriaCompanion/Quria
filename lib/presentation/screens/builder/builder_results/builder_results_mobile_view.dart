import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/presentation/screens/builder/builder_results/builder_results_mobile_item.dart';
import 'package:quria/presentation/var/routes.dart';

class BuilderResultsMobileView extends StatelessWidget {
  final List<Build> buildResults;
  const BuilderResultsMobileView({required this.buildResults, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(context,
            image: buildHeader,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textH1(
                  AppLocalizations.of(context)!.builder_results_title,
                  utf8: false,
                ),
                textBodyRegular(
                  AppLocalizations.of(context)!.builder_results_subtitle,
                  utf8: false,
                ),
              ],
            )),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          itemCount: buildResults.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(globalPadding(context)),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    routeBuilderRecap,
                    arguments: buildResults[index],
                  );
                },
                child: BuilderResultsMobileItem(buildResult: buildResults[index]),
              ),
            );
          },
        )
      ],
    );
  }
}
