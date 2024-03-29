import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_talent_grid_definition.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/mobile_components/talent_grid_mobile_item.dart';

class TalentGridMobileView extends StatefulWidget {
  final DestinyTalentGridDefinition talentGrid;
  final DestinyItemTalentGridComponent talentGridComponent;
  final DestinyInventoryItemDefinition subclass;
  final double width;
  const TalentGridMobileView(
      {required this.talentGrid,
      required this.talentGridComponent,
      required this.subclass,
      Key? key,
      required this.width})
      : super(key: key);

  @override
  State<TalentGridMobileView> createState() => _TalentGridMobileViewState();
}

class _TalentGridMobileViewState extends State<TalentGridMobileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(
          context,
          width: widget.width,
          image: CachedNetworkImageProvider(
              '${DestinyData.bungieLink}${widget.subclass.secondaryIcon!}?t={${BungieApiService.randomUserInt}}12345456'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textH1(widget.subclass.displayProperties?.name ?? ""),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: globalPadding(context),
          ),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: globalPadding(context)),
                  decoration:
                      const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: double.infinity,
                  child: Center(
                    child: textCaption(
                      AppLocalizations.of(context)!.builder_subclass_mods_caption,
                      utf8: false,
                    ),
                  )),
              mobileSectionInverted(
                context,
                title: AppLocalizations.of(context)!.class_ability,
                utf8: false,
                child: TalentGridMobileItem(
                  width: widget.width,
                  talentGridNodes: widget.talentGrid.nodes!,
                  talentGridComponent: [widget.talentGridComponent.nodes![2], widget.talentGridComponent.nodes![3]],
                ),
              ),
              mobileSectionInverted(
                context,
                title: AppLocalizations.of(context)!.jumps,
                utf8: false,
                child: TalentGridMobileItem(
                  width: widget.width,
                  talentGridNodes: widget.talentGrid.nodes!,
                  talentGridComponent: [
                    widget.talentGridComponent.nodes![4],
                    widget.talentGridComponent.nodes![5],
                    widget.talentGridComponent.nodes![6],
                  ],
                ),
              ),
              mobileSectionInverted(
                context,
                title: AppLocalizations.of(context)!.grenades,
                utf8: false,
                child: TalentGridMobileItem(
                  width: widget.width,
                  talentGridNodes: widget.talentGrid.nodes!,
                  talentGridComponent: [
                    widget.talentGridComponent.nodes![7],
                    widget.talentGridComponent.nodes![8],
                    widget.talentGridComponent.nodes![9],
                  ],
                ),
              ),
              mobileSectionInverted(
                context,
                title: AppLocalizations.of(context)!.sections,
                utf8: false,
                child: TalentGridMobileItem(
                  width: widget.width,
                  talentGridNodes: widget.talentGrid.nodes!,
                  talentGridComponent: [
                    widget.talentGridComponent.nodes![11],
                    widget.talentGridComponent.nodes![15],
                    widget.talentGridComponent.nodes![20],
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
