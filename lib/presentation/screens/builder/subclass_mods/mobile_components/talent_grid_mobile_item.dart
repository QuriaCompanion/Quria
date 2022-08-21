import 'package:bungie_api/models/destiny_talent_node.dart';
import 'package:bungie_api/models/destiny_talent_node_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class TalentGridMobileItem extends StatelessWidget {
  final List<DestinyTalentNodeDefinition> talentGridNodes;
  final List<DestinyTalentNode> talentGridComponent;
  final double width;
  const TalentGridMobileItem({
    required this.talentGridNodes,
    required this.talentGridComponent,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width - globalPadding(context) * 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pictureBordered(
            size: width * 0.192,
            image:
                '${DestinyData.bungieLink}${talentGridNodes[talentGridComponent.firstWhere((element) => element.isActivated!).nodeIndex!].steps![0].displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}123456',
          ),
          Container(
            padding: EdgeInsets.only(
              left: globalPadding(context) / 2,
            ),
            width: width - width * 0.192 - globalPadding(context) * 2.5,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: globalPadding(context) / 2,
              runSpacing: globalPadding(context) / 2,
              children: [
                for (var node
                    in talentGridComponent.where((element) => element.isActivated == null || !element.isActivated!))
                  InkWell(
                    // onTap: () {
                    //   showMaterialModalBottomSheet(
                    //       backgroundColor: Colors.transparent,
                    //       expand: false,
                    //       context: context,
                    //       builder: (context) {
                    //         return SubclassModModal(
                    //             mod: ManifestService.manifestParsed
                    //                 .destinyInventoryItemDefinition![plug]!,
                    //             onSocketChange: () {
                    //               setState(() {
                    //                 widget.onSocketChange(ManifestService
                    //                         .manifestParsed
                    //                         .destinyInventoryItemDefinition![
                    //                     plug]!);
                    //               });
                    //             });
                    //       });
                    // },
                    // onLongPress: () {
                    //   widget.onSocketChange(ManifestService.manifestParsed
                    //       .destinyInventoryItemDefinition![plug]!);
                    // },
                    child: pictureBordered(
                        image:
                            '${DestinyData.bungieLink}${talentGridNodes[node.nodeHash!].steps![0].displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}123456',
                        size: 44),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
