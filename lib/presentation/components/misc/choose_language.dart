import 'package:bungie_api/enums/bungie_membership_type.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/language_provider.dart';
import 'package:quria/main.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: blackLight,
        ),
        width: vw(context) * 0.5,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: globalPadding(context) * 2),
              child: Text(
                AppLocalizations.of(context)!.change_language,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: globalPadding(context)),
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: vw(context) * .2,
                  width: vw(context) * .8,
                  child: InkWell(
                    onTap: () {
                      Provider.of<LanguageProvider>(context, listen: false)
                          .setLanguage(
                              const Locale.fromSubtags(languageCode: 'fr'));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textBodyHighRegular(
                          AppLocalizations.of(context)!.fr,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
