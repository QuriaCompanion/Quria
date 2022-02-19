import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/misc/named_item.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/var/routes.dart';

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
    _future = display.getExotics(DestinyClass.Warlock);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width, child: exotic(context));
  }

  Widget exotic(BuildContext context) {
    const double textFontSize = 25;
    const double titleFontSize = 45;
    const double padding = 50;
    const double itemPadding = 30;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * globalPadding,
            left: MediaQuery.of(context).size.width * globalPadding,
            right: MediaQuery.of(context).size.width * globalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Veuillez choisir un exotique",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: titleFontSize),
            ),
            const SizedBox(height: padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 30,
                  child: Text(
                      "Prêt(e) à construire l’armure de vos rêves?\nÇa commence maintenant!\nCommencez par choisir une armure exotique qui sera la pièce maitresse de votre équipement.",
                      style: TextStyle(
                          color: Colors.white, fontSize: textFontSize)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: const VerticalDivider(
                    color: Colors.white,
                    thickness: 1.5,
                    width: padding * 2,
                  ),
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
                            list.add(Padding(
                              padding: const EdgeInsets.all(itemPadding / 2),
                              child: InkWell(
                                  onTap: () => {
                                        StorageService.setLocalStorage(
                                            "exotic", snapshot.data![i]),
                                        Navigator.pushNamed(
                                            context, routeFilter,
                                            arguments: snapshot.data![i].hash)
                                      },
                                  child: NamedItem(value: snapshot.data![i])),
                            ));
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
            )
          ],
        ),
      ),
    );
  }
}
