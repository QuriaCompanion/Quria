import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/builds/create/create_build_section.dart';
import 'package:quria/presentation/var/keys.dart';

class CreateBuildMobileView extends StatefulWidget {
  const CreateBuildMobileView({Key? key}) : super(key: key);

  @override
  State<CreateBuildMobileView> createState() => _CreateBuildMobileViewState();
}

class _CreateBuildMobileViewState extends State<CreateBuildMobileView> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _text = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(
          context,
          image: ghostBuild,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textH1(
                AppLocalizations.of(context)!.builder_stats_order_title,
                utf8: false,
              ),
              textBodyRegular(
                AppLocalizations.of(context)!.builder_stats_order_subtitle,
                utf8: false,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(globalPadding(context)),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                autofocus: false,
                onChanged: (text) => setState(() => _text),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    hintText: AppLocalizations.of(context)!.create_build_field,
                    hintStyle: const TextStyle(color: Colors.white)),
              ),
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.subclass,
                child: const CreateBuildSection(bucketHash: InventoryBucket.subclass),
              ),
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.kinetic,
                child: const CreateBuildSection(bucketHash: InventoryBucket.kineticWeapons),
              ),
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.energy,
                child: const CreateBuildSection(bucketHash: InventoryBucket.energyWeapons),
              ),
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.power,
                child: const CreateBuildSection(bucketHash: InventoryBucket.powerWeapons),
              ),
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.helmet,
                child: const CreateBuildSection(bucketHash: InventoryBucket.helmet),
              ),
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.gauntlets,
                child: const CreateBuildSection(bucketHash: InventoryBucket.gauntlets),
              ),
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.chest,
                child: const CreateBuildSection(bucketHash: InventoryBucket.chestArmor),
              ),
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.legs,
                child: const CreateBuildSection(bucketHash: InventoryBucket.legArmor),
              ),
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.class_item,
                child: const CreateBuildSection(bucketHash: InventoryBucket.classArmor),
              ),
              if (_controller.value.text.isEmpty) textBodyBold("You need to name your build!", color: crucible),
              if (Conditions.isBuildValid(Provider.of<CreateBuildProvider>(context).items))
                textBodyBold("You have too many exotics!", color: crucible),
              RoundedButton(
                  width: vw(context),
                  isDisabled: _controller.value.text.isEmpty ||
                      Conditions.isBuildValid(Provider.of<CreateBuildProvider>(context).items),
                  text: textBodyMedium(AppLocalizations.of(context)!.save, utf8: false, color: black),
                  onPressed: () async {
                    try {
                      await BuilderService().createBuild(context, _controller.text).then((value) {
                        ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                          content: textBodyMedium(
                            AppLocalizations.of(context)!.item_transfered,
                            utf8: false,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.green,
                        ));
                      });
                    } catch (e) {
                      return showDialog(context: context, builder: (context) => const ErrorDialog());
                    }
                  })
            ],
          ),
        )
      ],
    );
  }
}
