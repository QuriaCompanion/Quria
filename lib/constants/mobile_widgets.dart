import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/StatWeighing.enum.dart';

Widget mobileHeader(
  BuildContext context, {
  required ImageProvider<Object> image,
  required Widget child,
  double? width,
}) {
  width ??= vw(context);
  return Container(
    alignment: Alignment.bottomCenter,
    width: width,
    height: width * 0.9,
    decoration: BoxDecoration(image: DecorationImage(alignment: Alignment.topRight, fit: BoxFit.cover, image: image)),
    child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              black.withOpacity(0),
              black.withOpacity(1),
            ],
          ),
        ),
        alignment: Alignment.bottomCenter,
        height: width / 3.17,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
            child: SizedBox(width: width - globalPadding(context) * 2, child: child))),
  );
}

Widget getStatText(BuildContext context, StatWeighing statWeighing) {
  switch (statWeighing) {
    case StatWeighing.allTiers:
      return textBodyMedium(AppLocalizations.of(context)!.builder_stats_order_all_tiers, utf8: false);
    case StatWeighing.maxOne:
      return textBodyMedium(AppLocalizations.of(context)!.builder_stats_order_tier_1, utf8: false);
    case StatWeighing.maxTwo:
      return textBodyMedium(AppLocalizations.of(context)!.builder_stats_order_tier_2, utf8: false);
    case StatWeighing.maxThree:
      return textBodyMedium(AppLocalizations.of(context)!.builder_stats_order_tier_3, utf8: false);
  }
}

Widget mobileSection(
  BuildContext context, {
  required String title,
  required Widget child,
  bool utf8 = false,
  Color dividerColor = blackLight,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: globalPadding(context)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH2(title, utf8: utf8),
        Divider(
          color: dividerColor,
          height: 22,
          thickness: 1,
        ),
        child
      ],
    ),
  );
}

Widget mobileSectionInverted(
  BuildContext context, {
  bool utf8 = true,
  required String title,
  required Widget child,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: globalPadding(context)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH2(title, utf8: utf8),
        SizedBox(
          height: globalPadding(context) / 2,
        ),
        child,
        const Divider(
          color: blackLight,
          height: 22,
          thickness: 1,
        ),
      ],
    ),
  );
}

Widget mobileCard(
  BuildContext context, {
  required Widget child,
}) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: globalPadding(context)) * 0.875,
      decoration: const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
      width: double.infinity,
      child: child);
}

Widget pictureBordered({required String image, double size = 44}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 1,
      ),
    ),
    child: ExtendedImage.network(
      image,
      width: size,
      height: size,
      colorBlendMode: BlendMode.clear,
      timeLimit: const Duration(seconds: 10),
      cache: true,
      filterQuality: FilterQuality.high,
      fit: BoxFit.fill,
      printError: false,
    ),
  );
}
