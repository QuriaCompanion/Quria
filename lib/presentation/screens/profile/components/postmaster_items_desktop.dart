import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/screens/profile/components/postmasters_items.dart';

class PostmasterItemsDesktop extends StatelessWidget {
  const PostmasterItemsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textH2(AppLocalizations.of(context)!.postmaster, utf8: false),
            const SizedBox(height: 16),
            Container(
                width: 288,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: blackLight,
                ),
                child: const Center(child: PostmasterItems(width: 288))),
          ],
        ),
        SizedBox(
          width: vw(context) * 0.7,
        ),
      ],
    );
  }
}
