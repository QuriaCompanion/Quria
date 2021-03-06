import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class InProgressModal extends StatelessWidget {
  const InProgressModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(globalPadding(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textH2(AppLocalizations.of(context)!.wip, utf8: false),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: blackLight,
                      child: Icon(Icons.clear, size: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: blackLight,
              height: globalPadding(context),
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: globalPadding(context)),
              child: textBodyBold(
                AppLocalizations.of(context)!.coming_soon,
                utf8: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
