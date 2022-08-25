import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/inspect/inspect_build_provider.dart';
import 'package:quria/presentation/screens/builder/build_recap/builder_recap_mobile_view.dart';
import 'package:quria/presentation/screens/builder/builder_results/builder_results_desktop_item.dart';

class BuilderResultsDesktopView extends ConsumerWidget {
  final List<Build> buildResults;
  const BuilderResultsDesktopView({Key? key, required this.buildResults}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        desktopHeader(context,
            image: buildHeader,
            child: Padding(
              padding: EdgeInsets.all(globalPadding(context)),
              child: textDesktopTitle(
                AppLocalizations.of(context)!.builder_results_title,
                utf8: false,
              ),
            )),
        Padding(
          padding: EdgeInsets.all(globalPadding(context)),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            itemCount: buildResults.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: vw(context) > 1300 ? 3 : 2,
              mainAxisExtent: 270,
              crossAxisSpacing: globalPadding(context),
              mainAxisSpacing: globalPadding(context),
            ),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    ref.read(inspectBuildProvider.notifier).update((state) => state = buildResults[index]);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return desktopBuildModal(
                            context,
                            ref,
                            child: BuilderRecapMobileView(
                              width: modalWidth(context),
                              data: buildResults[index],
                            ),
                          );
                        });
                  },
                  child: BuilderResultsDesktopItem(buildResult: buildResults[index]));
            },
          ),
        )
      ],
    );
  }
}
