import 'package:bungie_api/destiny2.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/mobile_components/talent_grid_mobile_item.dart';

class TalentGridMobileView extends StatefulWidget {
  final DestinyTalentGridDefinition talentGrid;
  final DestinyItemTalentGridComponent talentGridComponent;
  final Function(DestinyItemTalentGridComponent) onChange;
  final DestinyInventoryItemDefinition subclass;
  const TalentGridMobileView(
      {required this.talentGrid,
      required this.talentGridComponent,
      required this.onChange,
      required this.subclass,
      Key? key})
      : super(key: key);

  @override
  State<TalentGridMobileView> createState() => _TalentGridMobileViewState();
}

class _TalentGridMobileViewState extends State<TalentGridMobileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(context,
            image: NetworkImage(
                DestinyData.bungieLink + widget.subclass.secondaryIcon!),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textH1("Configure ta doctrine"),
                textBodyRegular("Choisis tes Ã©lements de doctrine."),
              ],
            )),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: globalPadding(context),
          ),
          child: Column(
            children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: globalPadding(context)),
                  decoration: const BoxDecoration(
                      color: blackLight,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: double.infinity,
                  child: Center(
                    child: textCaption(
                        'Taper pour plus de dÃ©tails, maintenir pour Ã©quiper'),
                  )),
              mobileSectionInverted(
                context,
                title: "Capacites de classe",
                child: TalentGridMobileItem(
                  talentGridNodes: widget.talentGrid.nodes!,
                  talentGridComponent: [
                    widget.talentGridComponent.nodes![2],
                    widget.talentGridComponent.nodes![3]
                  ],
                  onChange: (talentGridComponent) {
                    widget.onChange(talentGridComponent);
                  },
                ),
              ),
              mobileSectionInverted(
                context,
                title: "Sauts",
                child: TalentGridMobileItem(
                  talentGridNodes: widget.talentGrid.nodes!,
                  talentGridComponent: [
                    widget.talentGridComponent.nodes![4],
                    widget.talentGridComponent.nodes![5],
                    widget.talentGridComponent.nodes![6],
                  ],
                  onChange: (talentGridComponent) {
                    widget.onChange(talentGridComponent);
                  },
                ),
              ),
              mobileSectionInverted(
                context,
                title: "Grenades",
                child: TalentGridMobileItem(
                  talentGridNodes: widget.talentGrid.nodes!,
                  talentGridComponent: [
                    widget.talentGridComponent.nodes![7],
                    widget.talentGridComponent.nodes![8],
                    widget.talentGridComponent.nodes![9],
                  ],
                  onChange: (talentGridComponent) {
                    widget.onChange(talentGridComponent);
                  },
                ),
              ),
              mobileSectionInverted(
                context,
                title: "Sections",
                child: TalentGridMobileItem(
                  talentGridNodes: widget.talentGrid.nodes!,
                  talentGridComponent: [
                    widget.talentGridComponent.nodes![11],
                    widget.talentGridComponent.nodes![15],
                    widget.talentGridComponent.nodes![20],
                  ],
                  onChange: (talentGridComponent) {
                    widget.onChange(talentGridComponent);
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
