import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/builds/list/build_card.dart';
import 'package:quria/presentation/var/routes.dart';

class ListBuildMobile extends StatelessWidget {
  final List<BuildStored> builds;
  const ListBuildMobile({Key? key, required this.builds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        mobileHeader(
          context,
          image: ghostBuild,
          child: textH1(
            AppLocalizations.of(context)!.builds,
            utf8: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: globalPadding(context), bottom: globalPadding(context) * 2),
          child: SizedBox(
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileNavItem(
                  selected: true,
                  value: AppLocalizations.of(context)!.builder_list,
                  width: vw(context) * 0.43,
                ),
                InkWell(
                    onTap: () {
                      Provider.of<CreateBuildProvider>(context, listen: false).clear();
                      Navigator.pushNamed(context, routeCreateBuild);
                    },
                    child: MobileNavItem(
                      value: AppLocalizations.of(context)!.create_build,
                      width: vw(context) * 0.43,
                    )),
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
            child: ListView.separated(
              itemCount: builds.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                height: globalPadding(context),
              ),
              itemBuilder: ((context, index) {
                return BuildCard(
                  buildStored: builds[index],
                  width: vw(context),
                );
              }),
            ))
      ],
    );
  }
}
