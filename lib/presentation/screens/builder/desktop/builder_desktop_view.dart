import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_armor_mods.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_custom_info.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_exotic_choice.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_info_row.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_stat_order.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_subclass.dart';
import 'package:quria/presentation/var/routes.dart';

class BuilderDesktopView extends ConsumerWidget {
  const BuilderDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(builderQuriaProvider.notifier).init();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        desktopHeader(
          context,
          image: buildHeaderWeb,
          alignment: const Alignment(0, -0.75),
          child: Padding(
            padding: EdgeInsets.all(globalPadding(context)),
            child: textDesktopTitle(
              AppLocalizations.of(context)!.quria_builder,
              utf8: false,
            ),
          ),
        ),
        builderContainer(context, child: const BuilderInfoRow()),
        SizedBox(
          height: globalPadding(context),
        ),
        builderContainer(context, child: const BuilderExoticChoice()),
        SizedBox(
          height: globalPadding(context),
        ),
        builderContainer(context, child: const BuilderStatOrder()),
        SizedBox(
          height: globalPadding(context),
        ),
        builderContainer(context, child: const BuilderSubclass()),
        SizedBox(
          height: globalPadding(context),
        ),
        builderContainer(context, child: const BuilderArmorMods()),
        SizedBox(
          height: globalPadding(context),
        ),
        builderContainer(context, child: const BuilderCustomInfo()),
        SizedBox(
          height: globalPadding(context),
        ),
        RoundedButton(
            buttonColor: yellow,
            isDisabled: ref.watch(builderQuriaProvider.select((value) => value.classItem)) == null,
            disabledColor: grey,
            text: textBodyBold(
              AppLocalizations.of(context)!.see_builds,
              color: black,
              utf8: false,
            ),
            onPressed: () => {Navigator.pushNamed(context, routeBuilder)}),
        SizedBox(
          height: globalPadding(context) * 1,
        ),
      ],
    );
  }
}
