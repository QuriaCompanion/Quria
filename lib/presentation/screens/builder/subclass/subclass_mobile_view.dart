import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/screens/builder/subclass/mobile_components/subclass_mobile_card.dart';

class SubclassMobileView extends StatelessWidget {
  final List<DestinyItemComponent> subclasses;
  const SubclassMobileView({required this.subclasses, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(context,
            image: subclassHeader,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textH1(
                  AppLocalizations.of(context)!.builder_subclass_title,
                  utf8: false,
                ),
                textBodyRegular(
                  AppLocalizations.of(context)!.builder_subclass_subtitle,
                  utf8: false,
                ),
              ],
            )),
        Wrap(
          spacing: globalPadding(context),
          runSpacing: globalPadding(context),
          children: [
            for (final subclass in subclasses)
              SubclassMobileCard(
                subclass: subclass,
              ),
          ],
        ),
        SizedBox(
          height: globalPadding(context) * 4,
        ),
      ],
    );
  }
}
