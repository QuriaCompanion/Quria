import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/quick_action.dart';

class ForeignBuildMobileActions extends StatelessWidget {
  final double width;
  const ForeignBuildMobileActions({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: globalPadding(context) / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QuickAction(
              icon: "assets/icons/Save.svg", title: AppLocalizations.of(context)!.save, width: width, onTap: () {}),
        ],
      ),
    );
  }
}
