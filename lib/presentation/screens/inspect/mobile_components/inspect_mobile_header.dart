import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class InspectMobileHeader extends StatelessWidget {
  final String name;
  final String type;
  final String? iconElement;
  final int? power;

  const InspectMobileHeader({required this.name, required this.type, this.iconElement, this.power, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: vw(context) - (globalPadding(context) * 2), child: textH1(name, maxLines: 2)),
        SizedBox(
          height: 22,
          child: Row(
            children: [
              if (iconElement != null)
                Image(
                  height: 16,
                  width: 16,
                  filterQuality: FilterQuality.high,
                  image: CachedNetworkImageProvider(
                      '${DestinyData.bungieLink}${iconElement!}?t={${BungieApiService.randomUserInt}}123426'),
                ),
              if (iconElement != null) const SizedBox(width: 8),
              if (power != null) textH2(power.toString()),
              if (power != null && iconElement != null) divider,
              textBodyRegular(type),
            ],
          ),
        ),
      ],
    );
  }
}
