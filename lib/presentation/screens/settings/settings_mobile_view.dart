import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quria/constants/texts.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsMobileView extends StatelessWidget {
  const SettingsMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const divider = Divider(color: Colors.white);
    return SizedBox(
      height: 400,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          InkWell(
            onTap: () {
              // TODO: implement manifest wipe
            },
            child: ListTile(
              leading: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 35,
              ),
              title: textBodyHighRegular(
                "Supprimer les données du manifestes",
                utf8: false,
              ),
              subtitle: textBodyMedium(
                "En cas de problème sur l'application",
                utf8: false,
              ),
            ),
          ),
          divider,
          ListTile(
            onTap: () {
              launchUrl(Uri.parse("https://www.buymeacoffee.com/quria?s=03"),
                  mode: LaunchMode.externalApplication);
            },
            leading: SvgPicture.asset(
              "assets/icons/buymeacoffee.svg",
              width: 35,
              height: 35,
            ),
            title: textBodyHighRegular(
              "BuyMeACofee",
              utf8: false,
            ),
            subtitle: textBodyMedium(
              "Si vous souhaitez nous supporter!",
              utf8: false,
            ),
          ),
          divider,
          ListTile(
            onTap: () {
              launchUrl(Uri.parse("https://twitter.com/quriacompanion"),
                  mode: LaunchMode.externalApplication);
            },
            leading: SvgPicture.asset(
              "assets/icons/twitter.svg",
              width: 35,
              height: 35,
            ),
            title: textBodyHighRegular(
              "QuriaCompanion sur twitter",
              utf8: false,
            ),
            subtitle: textBodyMedium(
              "Si vous avez besoin de nous contacter!",
              utf8: false,
            ),
          ),
          divider,
        ],
      ),
    );
  }
}
