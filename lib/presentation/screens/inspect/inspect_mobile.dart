import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/itemInfoHelper.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_armor_info.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_weapon_info.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_header.dart';
import 'package:quria/presentation/var/keys.dart';

class MobileInspect extends StatefulWidget {
  final InspectData data;
  const MobileInspect({Key? key, required this.data}) : super(key: key);
  @override
  State<MobileInspect> createState() => _MobileInspectState();
}

@override
class _MobileInspectState extends State<MobileInspect> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ItemInfoHelper data =
        DisplayService().getItemInfo(widget.data.instanceId, widget.data.hash);
    return ScaffoldBurgerAndBackOption(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            mobileHeader(
              context,
              image: NetworkImage(data.imageLink),
              child: InspectMobileHeader(
                name: data.itemDef.displayProperties!.name!,
                iconElement: data.elementIcon,
                type: data.itemDef.itemTypeDisplayName!,
                power: data.powerLevel,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: globalPadding(context),
            //       bottom: globalPadding(context) * 2),
            //   child: SizedBox(
            //     height: 45,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         InkWell(
            //             onTap: () {
            //               setState(() {
            //                 selected = "Informations";
            //               });
            //             },
            //             child: MobileNavItem(
            //               selected: selected == "Informations",
            //               value: "Informations",
            //               width: 171,
            //             )),
            //         InkWell(
            //             onTap: () {
            //               setState(() {
            //                 selected = "Recomendations";
            //               });
            //             },
            //             child: MobileNavItem(
            //               selected: "Recomendations" == selected,
            //               value: "Recomendations",
            //               width: 171,
            //             )),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(
                  left: globalPadding(context),
                  right: globalPadding(context),
                  bottom: globalPadding(context)),
              child: data.itemDef.itemType == DestinyItemType.Weapon
                  ? InspectMobileWeaponInfo(
                      item: data.itemDef,
                      stats: data.stats,
                      characterId: widget.data.characterId,
                      instanceId: widget.data.instanceId,
                      sockets: data.sockets,
                      plugs: data.plugs)
                  : InspectMobileArmorInfo(
                      item: data.itemDef,
                      stats: data.stats,
                      instanceId: widget.data.instanceId,
                      characterId: widget.data.characterId,
                      sockets: data.sockets,
                      afinityIcon: data.afinityIcon),
            )
          ],
        ),
      ),
    );
  }
}
