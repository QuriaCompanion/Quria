import 'package:bungie_api/api/destiny2.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

final Map<int, DestinyInventoryItemDefinition> manifest = {};

class ExoticWidget extends StatelessWidget {
  ExoticWidget({Key? key}) : super(key: key);
  final profile = ProfileService();
  final manifestService = ManifestService();

  getExotics() async {
    final items = profile.getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return exotic(context);
  }

  Widget exotic(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 200.0),
                  child: Text(
                    "Veuillez choisir un éxotique",
                    style: TextStyle(fontSize: 35),
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
                          style: TextStyle(fontSize: 30)),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.black54,
                    thickness: 1.5,
                    width: 20,
                  ),
                  Expanded(
                      child: FutureBuilder(
                          future: getExotics(),
                          builder: (context, AsyncSnapshot snapshot) {
                            return Container(
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade700,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.network(
                                              "https://www.bungie.net/common/destiny2_content/icons/7dda3e71787fa4ad24cfb4da6473699f.jpg",
                                              width: 150,
                                              fit: BoxFit.fill),
                                          const Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Flexible(
                                                child: Text(
                                                    "Aucun plan de sauvegarde",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                    overflow:
                                                        TextOverflow.clip)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(60),
                            );
                          }),
                      flex: 60),
                ],
              ),
            )
          ],
        ),
        padding: const EdgeInsets.all(100),
      ),
    );
  }
}


// https://www.bungie.net/common/destiny2_content/icons/8c7681f1e93ee996a724e55554e079e9.jpg