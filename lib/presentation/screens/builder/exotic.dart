import 'dart:convert';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/var/routes.dart';

class ExoticWidget extends StatelessWidget {
  DisplayService display = DisplayService();
  ExoticWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                    "https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg"))),
        child: exotic(context));
  }

  Widget exotic(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 200.0),
                    child: Text(
                      "Veuillez choisir un éxotique",
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 30,
                      child: Padding(
                        padding: EdgeInsets.only(left: 60.0, right: 60),
                        child: Text(
                            "Prêt à construire votre armure de rêve?\nÇa commence maintenant!\nCommencez par choisir une armure exotique qui sera la pièrce maitresse de votre équipement.",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 1.5,
                      width: 20,
                    ),
                    Expanded(
                      flex: 60,
                      child: FutureBuilder(
                          future: display.getExotics(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              List<Widget> list = <Widget>[];
                              for (var i = 0; i < snapshot.data.length; i++) {
                                list.add(item(context, snapshot.data[i]));
                              }
                              return Container(
                                child: Wrap(
                                  children: list,
                                ),
                                padding: const EdgeInsets.all(60),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
          padding: const EdgeInsets.all(100),
        ),
      ),
    );
  }

  Widget item(BuildContext context, DestinyInventoryItemDefinition data) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeBuilder),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                  "https://www.bungie.net" + data.displayProperties!.icon!,
                  width: 150,
                  fit: BoxFit.fill),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    utf8.decode(data.displayProperties!.name!.runes.toList()),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    overflow: TextOverflow.clip),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
