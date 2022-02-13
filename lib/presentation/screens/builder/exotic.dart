import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/exotic_item.dart';
import 'package:quria/presentation/components/loader.dart';

class ExoticWidget extends StatefulWidget {
  const ExoticWidget({Key? key}) : super(key: key);

  @override
  _ExoticWidgetState createState() => _ExoticWidgetState();
}

class _ExoticWidgetState extends State<ExoticWidget> {
  final DisplayService display = DisplayService();
  late Future<List<DestinyInventoryItemDefinition>> _future;
  @override
  void initState() {
    super.initState();
    _future = display.getExotics();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: ghostBackground,
        child: exotic(context));
  }

  Widget exotic(BuildContext context) {
    const double textFontSize = 25;
    const double titleFontSize = 45;
    const double padding = 50;
    const double itemPadding = 60;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: (MediaQuery.of(context).size.width / 100) * 5,
            left: (MediaQuery.of(context).size.width / 100) * 5,
            right: (MediaQuery.of(context).size.width / 100) * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Veuillez choisir un éxotique",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: titleFontSize),
            ),
            const SizedBox(height: padding),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 30,
                    child: Text(
                        "Prêt à construire votre armure de rêve?\nÇa commence maintenant!\nCommencez par choisir une armure exotique qui sera la pièrce maitresse de votre équipement.",
                        style: TextStyle(
                            color: Colors.white, fontSize: textFontSize)),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 1.5,
                    width: padding * 2,
                  ),
                  Expanded(
                    flex: 60,
                    child: FutureBuilder(
                        future: _future,
                        builder: (context,
                            AsyncSnapshot<List<DestinyInventoryItemDefinition>>
                                snapshot) {
                          if (snapshot.hasData) {
                            List<Widget> list = <Widget>[];
                            for (var i = 0; i < snapshot.data!.length; i++) {
                              list.add(ExoticItem(value: snapshot.data![i]));
                            }
                            return Container(
                              padding: const EdgeInsets.all(itemPadding),
                              child: Wrap(
                                children: list,
                              ),
                            );
                          } else {
                            return const Loader();
                          }
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
