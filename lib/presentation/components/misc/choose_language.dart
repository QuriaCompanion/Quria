import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/language_provider.dart';
import 'package:quria/data/services/storage/storage.service.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  void changeLanguage(BuildContext context, {required String lang}) async {
    Provider.of<LanguageProvider>(context, listen: false)
        .setLanguage(Locale.fromSubtags(languageCode: lang));
    await StorageService.setLocalStorage('lang', lang);
  }

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
                      changeLanguage(context, lang: 'fr');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textBodyHighRegular(
                          AppLocalizations.of(context)!.fr,
                          utf8: false,
                        ),
                      ],
                    ),
                  ),
                ),
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
                      changeLanguage(context, lang: 'en');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textBodyHighRegular(
                          AppLocalizations.of(context)!.en,
                          utf8: false,
                        ),
                      ],
                    ),
                  ),
                ),
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
                      changeLanguage(context, lang: 'es');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textBodyHighRegular(
                          AppLocalizations.of(context)!.es,
                          utf8: false,
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
