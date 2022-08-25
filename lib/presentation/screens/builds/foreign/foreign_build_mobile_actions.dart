import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/presentation/components/misc/quick_action.dart';
import 'package:quria/presentation/var/keys.dart';

class ForeignBuildMobileActions extends ConsumerWidget {
  final double width;
  final BuildStored storeBuild;
  const ForeignBuildMobileActions({
    required this.storeBuild,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: globalPadding(context) / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QuickAction(
              icon: "assets/icons/Save.svg",
              title: AppLocalizations.of(context)!.save,
              width: width,
              onTap: () {
                if (storeBuild.preset != null) {
                  BuilderService().useForeignBuild(context, ref, storeBuild);
                  return;
                }
                ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                  content: textBodyMedium(
                    AppLocalizations.of(context)!.build_no_mods,
                    utf8: false,
                    color: Colors.white,
                  ),
                  backgroundColor: crucible,
                ));
              }),
        ],
      ),
    );
  }
}
