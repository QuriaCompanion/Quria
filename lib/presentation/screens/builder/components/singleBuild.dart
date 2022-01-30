import 'package:flutter/material.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/statisticDisplay.dart';
import 'package:quria/presentation/screens/builder/components/extendedBuilderInfo.dart';

class SingleBuild extends StatelessWidget {
  final Build buildInfo;
  const SingleBuild({Key? key, required this.buildInfo}) : super(key: key);

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
        width: 85,
      ));
    }
    List<Widget> listArmor = <Widget>[];
    for (var i = 0; i < buildInfo.equipement.length; i++) {
      listArmor.add(Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
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
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(16),
            width: 600,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Base: ${buildInfo.stats.base}',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 25)),
                        Text('Final: ${buildInfo.stats.max}',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 25))
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: listStats),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: listArmor),
                  ExtendedData(buildInfo: buildInfo),
                ]),
          ),
        ),
        const SizedBox(height: 25)
      ],
    );
  }
}
