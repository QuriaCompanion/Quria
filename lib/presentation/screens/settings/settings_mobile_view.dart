import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/misc/choose_membership.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/var/routes.dart';
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
              StorageService.resetManifest().then((value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: textBodyMedium(
                    AppLocalizations.of(context)!.manifest_deleted,
                    utf8: false,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.green,
                ));
              }, onError: (_) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const ErrorDialog();
                    });
              });
            },
            child: ListTile(
              leading: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 35,
              ),
              title: textBodyHighRegular(
                AppLocalizations.of(context)!.manifest_delete,
                utf8: false,
              ),
              subtitle: textBodyMedium(
                AppLocalizations.of(context)!.manifest_delete_caption,
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
              AppLocalizations.of(context)!.support,
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
              AppLocalizations.of(context)!.twitter,
              utf8: false,
            ),
            subtitle: textBodyMedium(
              AppLocalizations.of(context)!.twitter_caption,
              utf8: false,
            ),
          ),
          divider,
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ChooseMembership(
                      memberships:
                          AccountService.membershipData!.destinyMemberships!,
                      onSelected: (membership) {
                        AccountService()
                            .saveMembership(
                                AccountService.membershipData!, membership)
                            .then((_) {
                          DisplayService.isProfileUp = false;
                          ProfileService().reset();
                          Navigator.pushReplacementNamed(context, routeProfile);
                        });
                      },
                    );
                  });
            },
            leading: Image.network(
              "https://www.bungie.net/7/ca//destiny/logos/crossSave.png",
              width: 35,
              height: 35,
            ),
            title: textBodyHighRegular(
              AppLocalizations.of(context)!.change_platform,
              utf8: false,
            ),
            subtitle: textBodyMedium(
              AppLocalizations.of(context)!.change_platform_caption,
              utf8: false,
            ),
          ),
          divider,
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ChooseMembership(
                      memberships:
                          AccountService.membershipData!.destinyMemberships!,
                      onSelected: (membership) {
                        AccountService()
                            .saveMembership(
                                AccountService.membershipData!, membership)
                            .then((_) {
                          DisplayService.isProfileUp = false;
                          ProfileService().reset();
                          Navigator.pushReplacementNamed(context, routeProfile);
                        });
                      },
                    );
                  });
            },
            leading: const Icon(Icons.language, size: 35),
            title: textBodyHighRegular(
              AppLocalizations.of(context)!.change_platform,
              utf8: false,
            ),
            subtitle: textBodyMedium(
              AppLocalizations.of(context)!.change_platform_caption,
              utf8: false,
            ),
          ),
          divider,
        ],
      ),
    );
  }
}
