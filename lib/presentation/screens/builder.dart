import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quria/data/services/backend/bungie_backend_api.service.dart';
import 'package:quria/data/models/BuildResponse.model.dart';

//TODO: better split into smaller widget and define global variable for style
class BuilderWidget extends StatelessWidget {
  final BackendService _backendService = BackendService();
  BuilderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var future = _backendService.getBuilds();
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Widget> list = <Widget>[];
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
        });
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
      listStats.add(statisticDisplay(context, values[i], i));
    }
    List<Widget> listArmor = <Widget>[];
    for (var i = 0; i < data.equipement.length; i++) {
      listArmor.add(Image.network(data.equipement[i].icon));
    }
    return Center(
      child: Container(
        color: Colors.grey[500],
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Base: ${data.stats.base}',
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                Text('Final: ${data.stats.max}',
                    style: TextStyle(color: Colors.white, fontSize: 25))
              ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: listStats),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: listArmor),
              ExtendedData(build: data),
            ]),
        padding: EdgeInsets.all(16),
        width: 600,
      ),
    );
  }

  Widget statisticDisplay(BuildContext context, int value, int i) {
    String link =
        "https://www.bungie.net/common/destiny2_content/icons/e26e0e93a9daf4fdd21bf64eb9246340.png";
    switch (i) {
      case 1:
        link =
            "https://www.bungie.net/common/destiny2_content/icons/202ecc1c6febeb6b97dafc856e863140.png";
        break;
      case 2:
        link =
            "https://www.bungie.net/common/destiny2_content/icons/128eee4ee7fc127851ab32eac6ca91cf.png";
        break;
      case 3:
        link =
            "https://www.bungie.net/common/destiny2_content/icons/ca62128071dc254fe75891211b98b237.png";
        break;
      case 4:
        link =
            "https://www.bungie.net/common/destiny2_content/icons/59732534ce7060dba681d1ba84c055a6.png";
        break;
      case 5:
        link =
            "https://www.bungie.net/common/destiny2_content/icons/c7eefc8abbaa586eeab79e962a79d6ad.png";
        break;
    }
    return Row(
      children: [
        Image.network(link, width: 40, height: 40),
        Text('$value', style: TextStyle(color: Colors.white, fontSize: 25))
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
      for (var i = 0; i < widget.build.material!.length; i++) {
        listMaterial.add(miscComponent(context, widget.build.material![i]));
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
            color: Colors.white,
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
                      child: Text('Mods à équiper'),
                    ),
                    Text('Matériaux nécessaire'),
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
            Text(mod.name),
            Text('${mod.number}')
          ]),
    );
  }
}
