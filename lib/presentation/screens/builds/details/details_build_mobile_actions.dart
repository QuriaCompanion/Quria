// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/providers/details_build_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/components/misc/quick_action.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/var/keys.dart';
import 'package:quria/presentation/var/routes.dart';

class DetailsBuildMobileActions extends StatefulWidget {
  final double width;
  const DetailsBuildMobileActions({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsBuildMobileActions> createState() => _DetailsBuildMobileActionsState();
}

class _DetailsBuildMobileActionsState extends State<DetailsBuildMobileActions> {
  @override
  Widget build(BuildContext context) {
    BuildStored build = Provider.of<DetailsBuildProvider>(context, listen: false).buildStored!;
    return Padding(
      padding: EdgeInsets.only(top: globalPadding(context) / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QuickAction(
              icon: "assets/icons/Equip.svg",
              title: AppLocalizations.of(context)!.equip,
              width: widget.width,
              onTap: () {
                BungieActionsService().equipStoredBuild(context, items: build.items);
              }),
          QuickAction(
              icon: "assets/icons/Share.svg",
              title: AppLocalizations.of(context)!.share,
              width: widget.width,
              onTap: () {
                showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return const InProgressModal();
                    });
              }),
          QuickAction(
              icon: "assets/icons/Save.svg",
              title: AppLocalizations.of(context)!.modify,
              width: widget.width,
              onTap: () {
                Provider.of<CreateBuildProvider>(context, listen: false).modifyBuild(build);
                Navigator.of(context).pushNamed(routeCreateBuild);
              }),
          QuickAction(
              icon: "assets/icons/trash.svg",
              title: AppLocalizations.of(context)!.delete,
              width: widget.width,
              onTap: () {
                showMaterialModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return DeleteConfirmation(
                        text: AppLocalizations.of(context)!.build_delete_confirm,
                        width: widget.width,
                        onDelete: () async {
                          try {
                            await BuilderService().deleteBuild(build.id).then((_) {
                              ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                                content: textBodyMedium(
                                  AppLocalizations.of(context)!.build_created_success,
                                  utf8: false,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.green,
                              ));
                              Navigator.pushNamed(context, routeListBuilds);
                            });
                          } catch (e) {
                            return showDialog(context: context, builder: (context) => const ErrorDialog());
                          }
                        },
                      );
                    });
              }),
        ],
      ),
    );
  }
}

class DeleteConfirmation extends StatelessWidget {
  final VoidCallback onDelete;
  final double width;
  final String text;
  const DeleteConfirmation({
    required this.onDelete,
    required this.width,
    required this.text,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
        color: blackLight,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      padding: EdgeInsets.all(globalPadding(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: textBodyBold(text, utf8: false)),
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
          SizedBox(height: globalPadding(context)),
          RoundedButton(
              text: textBodyBold("Supprimer"), buttonColor: crucible, width: width, onPressed: () => onDelete),
        ],
      ),
    );
  }
}
