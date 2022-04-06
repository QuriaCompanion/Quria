import 'dart:convert';

import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/cubit/attributs_details_cubit.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/attributs_details.dart';

@immutable
class ProfileMobileItemCard extends StatelessWidget {
  final profile = ProfileService();
  final DestinyItemComponent item;
  final double width;
  final double imageSize;
  final double titleFontSize;
  final double fontSize;
  final double itemPadding;
  final double itemChildPadding;

  ProfileMobileItemCard(
      {required this.item,
      required this.width,
      this.imageSize = 100,
      this.titleFontSize = 20,
      this.fontSize = 10,
      this.itemPadding = 5,
      this.itemChildPadding = 5,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        child: BlocProvider(
            create: (context) => AttributsDetailsCubit(),
            child: BlocBuilder<AttributsDetailsCubit, AttributsDetailsState>(
                builder: (context, attributeState) {
              return Container(
                  padding: EdgeInsets.all(itemPadding),
                  width: width,
                  decoration: blackTransparentBackground,
                  child: Column(
                    children: [
                      Text(
                        utf8.decode(ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition![item.itemHash]!
                            .displayProperties!
                            .name!
                            .runes
                            .toList()),
                        style: TextStyle(
                            fontSize: titleFontSize, color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                              image: NetworkImage(DestinyData.bungieLink +
                                  ManifestService
                                      .manifestParsed
                                      .destinyInventoryItemDefinition![
                                          item.overrideStyleItemHash ??
                                              item.itemHash]!
                                      .displayProperties!
                                      .icon!)),
                          if (attributeState is AttributsDetailsIdState)
                            AttributsDetails(
                              item: item,
                              fontSize: fontSize,
                              padding: itemChildPadding,
                              socketId: attributeState.id,
                              iconSize:
                                  ((width - imageSize - itemPadding * 2) / 7) -
                                      itemChildPadding * 2,
                              width: (width - imageSize - itemPadding * 2) - 15,
                            )
                          else
                            AttributsDetails(
                              item: item,
                              fontSize: fontSize,
                              padding: itemChildPadding,
                              iconSize:
                                  ((width - imageSize - itemPadding * 2) / 7) -
                                      itemChildPadding * 2,
                              width: (width - imageSize - itemPadding * 2) - 15,
                            )
                        ],
                      ),
                    ],
                  ));
            })));
  }
}
