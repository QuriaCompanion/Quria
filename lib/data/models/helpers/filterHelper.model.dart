import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@immutable
class FilterHelper {
  final String icon;
  final int value;
  const FilterHelper({
    required this.icon,
    required this.value,
  });
}

String fromIntToName(BuildContext context, int value) {
  switch (value) {
    case 2996146975:
      return AppLocalizations.of(context)!.mobility;
    case 392767087:
      return AppLocalizations.of(context)!.resilience;
    case 1943323491:
      return AppLocalizations.of(context)!.recovery;
    case 1735777505:
      return AppLocalizations.of(context)!.discipline;
    case 144602215:
      return AppLocalizations.of(context)!.intellect;
    case 4244567218:
      return AppLocalizations.of(context)!.strength;
    default:
      return "wut";
  }
}

String fromIntToIcon(int value) {
  switch (value) {
    case 2996146975:
      return "mobility.svg";
    case 392767087:
      return "resilience.svg";
    case 1943323491:
      return "recovery.svg";
    case 1735777505:
      return "discipline.svg";
    case 144602215:
      return "intellect.svg";
    case 4244567218:
      return "strength.svg";
    default:
      return "wut";
  }
}
