import 'dart:developer';

import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/backend/bungie_backend_api.service.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/statisticDisplay.dart';

Map<int, DestinyInventoryItemDefinition> _manifestParsed = {};

//TODO: better split into smaller widget and define global variable for style
class BuilderWidget extends StatelessWidget {
  final BackendService _backendService = BackendService();
  final manifest = ManifestService();

  Future<BuildResponse?> promise() async {
    // var manifestResponse = await manifest.getManifest();
    BuildResponse? response = await _backendService.getBuilds();
    // _manifestParsed = manifestResponse;
    return response;
  }

  BuilderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<BuildResponse?> future = promise();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                  "https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg"))),
      child: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Widget> list = <Widget>[];
              list.add(const SizedBox(height: 25));
              for (var i = 0; i < snapshot.data.builds.length; i++) {
                list.add(singleBuild(context, snapshot.data.builds[i]));
              }
              return ListView(
                children: list,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget singleBuild(BuildContext context, Build data) {
    var values = [
      data.stats.mobility,
      data.stats.resilience,
      data.stats.recovery,
      data.stats.discipline,
      data.stats.intellect,
      data.stats.strength,
    ];
    List<Widget> listStats = <Widget>[];
    for (var i = 0; i < 6; i++) {
      listStats.add(StatisticDisplay(value: values[i], i: i));
    }
    List<Widget> listArmor = <Widget>[];
    for (var i = 0; i < data.equipement.length; i++) {
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
          child: Image.network('https://www.bungie.net' +
              _manifestParsed[data.equipement[i].hash]!
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
                        Text('Base: ${data.stats.base}',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 25)),
                        Text('Final: ${data.stats.max}',
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
                  ExtendedData(build: data),
                ]),
          ),
        ),
        const SizedBox(height: 25)
      ],
    );
  }
}

class ExtendedData extends StatefulWidget {
  final Build build;
  const ExtendedData({required this.build, Key? key}) : super(key: key);

  @override
  _ExtendedDataState createState() => _ExtendedDataState();
}

class _ExtendedDataState extends State<ExtendedData> {
  bool isVisible = false;
  IconData icon = Icons.arrow_downward_outlined;
  @override
  Widget build(BuildContext context) {
    List<Widget> listMod = <Widget>[];
    for (var i = 0; i < widget.build.mod.length; i++) {
      listMod.add(miscComponent(context, widget.build.mod[i]));
    }
    List<Widget> listMaterial = <Widget>[];
    if (widget.build.material != null) {
      for (var i = 0; i < widget.build.material.length; i++) {
        listMaterial.add(miscComponent(context, widget.build.material[i]));
      }
    }
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() => isVisible = !isVisible);
            setState(() => icon = isVisible
                ? Icons.arrow_upward_outlined
                : Icons.arrow_downward_outlined);
          },
          child: Icon(
            icon,
            color: Colors.white70,
            size: 45.0,
          ),
        ),
        if (isVisible)
          Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Mods à équiper',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 15)),
                    ),
                    Text('Matériaux nécessaire',
                        style: TextStyle(color: Colors.white70, fontSize: 15)),
                  ]),
              Row(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 45,
                      child: Column(
                        textDirection: TextDirection.ltr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: listMod,
                      ),
                    ),
                    const Expanded(flex: 10, child: SizedBox()),
                    Expanded(
                      flex: 45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.ltr,
                        children: listMaterial,
                      ),
                    )
                  ])
            ],
          ),
      ],
    );
  }

  Widget miscComponent(BuildContext context, mod) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.ltr,
          children: [
            Image.network(mod.icon),
            Text(mod.name, style: TextStyle(color: Colors.white70)),
            Text('${mod.number}', style: TextStyle(color: Colors.white70))
          ]),
    );
  }
}
