import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_origin.dart';

class CollectionArmorView extends ConsumerWidget {
  final double width;
  const CollectionArmorView({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemDef = ref.watch(inspectProvider.select((value) => value?.itemDef))!;
    return Column(
      children: [
        mobileSection(context,
            title: AppLocalizations.of(context)!.origin,
            child: InspectMobileOrigin(collectionHash: itemDef.collectibleHash)),
        SizedBox(
          height: globalPadding(context) * 3,
        )
      ],
    );
  }
}
