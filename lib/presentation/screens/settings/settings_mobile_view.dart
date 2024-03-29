import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/misc/choose_language.dart';
import 'package:quria/presentation/components/misc/choose_membership.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/screens/legends/legends_page.dart';
import 'package:quria/presentation/var/routes.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsMobileView extends StatelessWidget {
  final double height;
  const SettingsMobileView({
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const divider = Divider(color: grey);
    return Column(
      children: [
        ListView(
          shrinkWrap: true,
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
            if (kIsWeb || !Platform.isIOS) ...[
              divider,
              ListTile(
                onTap: () {
                  launchUrl(Uri.parse("https://www.buymeacoffee.com/quria?s=03"), mode: LaunchMode.externalApplication);
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
            ],
            divider,
            ListTile(
              onTap: () {
                launchUrl(Uri.parse("https://twitter.com/quriacompanion"), mode: LaunchMode.externalApplication);
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
                if (isMobile(context)) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ChooseMembership(
                          memberships: AccountService.membershipData!.destinyMemberships!,
                          onSelected: (membership) {
                            AccountService.saveMembership(AccountService.membershipData!, membership).then((_) {
                              DisplayService.isProfileUp = false;
                              ProfileService.reset(context);
                              Navigator.pushReplacementNamed(context, routeProfile);
                            });
                          },
                        );
                      });
                  return;
                }
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                          child: Container(
                              width: vw(context) * 0.4,
                              height: vw(context) * 0.3,
                              color: black,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  ChooseMembership(
                                    memberships: AccountService.membershipData!.destinyMemberships!,
                                    onSelected: (membership) {
                                      AccountService.saveMembership(AccountService.membershipData!, membership)
                                          .then((_) {
                                        DisplayService.isProfileUp = false;
                                        ProfileService.reset(context);
                                        Navigator.pushReplacementNamed(context, routeProfile);
                                      });
                                    },
                                  ),
                                ],
                              )));
                    });
              },
              leading: Image.asset(
                "assets/img/crossSave.png",
                width: 35,
                height: 35,
                colorBlendMode: BlendMode.clear,
                filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
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
                if (isMobile(context)) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ChooseLanguage(
                          width: vw(context),
                        );
                      });
                  return;
                }
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                          child: SizedBox(
                              width: vw(context) * 0.4,
                              child: ChooseLanguage(
                                width: vw(context) * .4,
                              )));
                    });
              },
              leading: const Icon(Icons.language, size: 35, color: Colors.white),
              title: textBodyHighRegular(
                AppLocalizations.of(context)!.change_language,
                utf8: false,
              ),
            ),
            divider,
            ListTile(
              onTap: () {
                if (isMobile(context)) {
                  Navigator.pushReplacementNamed(context, routePageLegends);
                  return;
                }
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                          child: Container(
                              width: vw(context) * 0.4,
                              height: vw(context) * 0.3,
                              color: black,
                              padding: const EdgeInsets.all(16),
                              child: const LegendsPage()));
                    });
              },
              leading: const Icon(Icons.handshake, size: 35, color: Colors.white),
              title: textBodyHighRegular('Hall of Fame', utf8: false),
            ),
            if (vw(context) > 1000) divider,
            if (vw(context) > 1000)
              ListTile(
                onTap: () {
                  DisplayService.isProfileUp = false;
                  ProfileService.reset(context);
                  AccountService.reset();
                  Navigator.pushNamed(context, routeLogin);
                },
                leading: SvgPicture.asset(
                  "assets/icons/Off.svg",
                  height: 35,
                ),
                title: textBodyHighRegular(AppLocalizations.of(context)!.logout, utf8: false),
              ),
          ],
        ),
        SizedBox(
          height: vh(context) * 0.1,
        ),
        textCaption("@ 2022, QuriaCompanion, Eyes up Guardian.")
      ],
    );
  }
}
