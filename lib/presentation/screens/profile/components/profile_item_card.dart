import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/cubit/attributs_details_cubit.dart';
import 'package:quria/cubit/character_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/presentation/components/icon_item.dart';

class ProfileItemCard extends StatelessWidget {
  final DestinyItemComponent displayedItem;
  final double sizes;

  ///this should be the margin between the cards so 1/2 on top and 1/2 on bottom
  final double margin;
  const ProfileItemCard({
    Key? key,
    required this.displayedItem,
    this.sizes = 150,
    this.margin = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayHash =
        displayedItem.overrideStyleItemHash ?? displayedItem.itemHash!;
    return Container(
      child: InkWell(
        onTap: () {
          context.read<AttributsDetailsCubit>().changeId(0);
          context.read<CharacterCubit>().showDetails(displayedItem);
        },
        child: ItemIcon(displayHash: displayHash, imageSize: sizes),
      ),
      margin: EdgeInsets.only(top: margin / 2, bottom: margin / 2),
    );
  }
}
