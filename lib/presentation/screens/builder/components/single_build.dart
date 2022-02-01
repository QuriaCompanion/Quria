import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/statistic_display.dart';
import 'package:quria/presentation/screens/builder/components/extended_builder_info.dart';

class SingleBuild extends StatelessWidget {
  final Build buildInfo;
  final double width;
  final double spacing;
  final double padding;
  final double fontSize;
  const SingleBuild(
      {required this.buildInfo,
      this.padding = 15,
      this.spacing = 30,
      this.width = 600,
      this.fontSize = 25,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var values = [
      buildInfo.stats.mobility,
      buildInfo.stats.resilience,
      buildInfo.stats.recovery,
      buildInfo.stats.discipline,
      buildInfo.stats.intellect,
      buildInfo.stats.strength,
    ];
    List<Widget> listStats = <Widget>[];
    for (var i = 0; i < 6; i++) {
      listStats.add(StatisticDisplay(
        value: values[i],
        icon: DestinyData.statsIcon[i],
        width: (width - (padding * 2)) / 6,
      ));
    }
    List<Widget> listArmor = <Widget>[];
    for (var i = 0; i < buildInfo.equipement.length; i++) {
      listArmor.add(Container(
          decoration: regularShadow,
          child: Image.network(DestinyData.bungieLink +
              ManifestService
                  .manifestParsed
                  .destinyInventoryItemDefinition![
                      buildInfo.equipement[i].hash]!
                  .displayProperties!
                  .icon!)));
    }
    return Column(
      children: [
        Center(
          child: Container(
            decoration: greyTransparentBackground,
            padding: EdgeInsets.all(padding),
            width: width,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Base: ${buildInfo.stats.base}',
                            style: TextStyle(
                                color: Colors.white70, fontSize: fontSize)),
                        Text('Final: ${buildInfo.stats.max}',
                            style: TextStyle(
                                color: Colors.white70, fontSize: fontSize))
                      ]),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: padding),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: listStats),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: listArmor),
                  ExtendedBuilderInfo(
                      padding: padding,
                      buildInfo: buildInfo,
                      fontSize: fontSize),
                ]),
          ),
        ),
        SizedBox(
          height: spacing,
        )
      ],
    );
  }
}
