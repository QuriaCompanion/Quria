import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/language_provider.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/var/routes.dart';

class ChooseLanguage extends StatelessWidget {
  final double width;
  const ChooseLanguage({Key? key, required this.width}) : super(key: key);

  void changeLanguage(BuildContext context, {required String lang}) async {
    Provider.of<LanguageProvider>(context, listen: false).setLanguage(Locale.fromSubtags(languageCode: lang));
    DisplayService.isProfileUp = false;
    DisplayService.isManifestUp = false;
    ProfileService.reset(context);
    StorageService.setLocalStorage('lang', lang).then((value) => {Navigator.pushNamed(context, routeProfile)});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: black,
        ),
        padding: EdgeInsets.all(globalPadding(context)),
        width: width * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: globalPadding(context) * 2),
                  child: textH2(AppLocalizations.of(context)!.change_language, utf8: false),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.clear,
                      size: 20,
                      color: black,
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        changeLanguage(context, lang: 'fr');
                      },
                      child: ListTile(
                        title: textBodyHighRegular(
                          AppLocalizations.of(context)!.fr,
                          utf8: false,
                        ),
                      ),
                    ),
                    const Divider(color: Colors.white)
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        changeLanguage(context, lang: 'en');
                      },
                      child: ListTile(
                        title: textBodyHighRegular(
                          AppLocalizations.of(context)!.en,
                          utf8: false,
                        ),
                      ),
                    ),
                    const Divider(color: Colors.white)
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        changeLanguage(context, lang: 'es');
                      },
                      child: ListTile(
                        title: textBodyHighRegular(
                          AppLocalizations.of(context)!.es,
                          utf8: false,
                        ),
                      ),
                    ),
                    const Divider(color: Colors.white)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
