import 'dart:async';

import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/misc/named_item.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/search_bar.dart';
import 'package:quria/presentation/screens/builder/components/character_choice.dart';
import 'package:quria/presentation/var/routes.dart';

class ExoticWidget extends StatefulWidget {
  const ExoticWidget({Key? key}) : super(key: key);

  @override
  _ExoticWidgetState createState() => _ExoticWidgetState();
}

class _ExoticWidgetState extends State<ExoticWidget> {
  final DisplayService display = DisplayService();
  late Future<List<DestinyInventoryItemDefinition>> _future;
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    _future = display.getExotics(DestinyClass.Warlock);
  }

  String title = "Veuillez choisir un exotique";
  String subtitle =
      "Prêt(e) à construire l’armure de vos rêves?\nÇa commence maintenant!\nCommencez par choisir une armure exotique qui sera la pièce maitresse de votre équipement.";
  double textFontSize = 25;
  double titleFontSize = 45;
  double padding = 50;
  double itemPadding = 30;
  double itemSize = 150;
  List<Widget> list = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width, child: exotic());
  }

  Widget exotic() {
    if (MediaQuery.of(context).size.width < 1420) {
      textFontSize = 20;
      titleFontSize = 35;
      padding = 30;
      itemPadding = 20;
      itemSize = 100;
    }
    if (MediaQuery.of(context).size.width < 1200) {
      textFontSize = 15;
      titleFontSize = 30;
      padding = 20;
      itemPadding = 10;
      itemSize = 80;
    }
    if (MediaQuery.of(context).size.width < 850) {
      return mobileView();
    }
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * globalPadding,
            left: MediaQuery.of(context).size.width * globalPadding,
            right: MediaQuery.of(context).size.width * globalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: titleFontSize),
            ),
            SizedBox(height: padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 30,
                  child: Text(subtitle,
                      style: TextStyle(
                          color: Colors.white, fontSize: textFontSize)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 1.5,
                    width: padding * 2,
                  ),
                ),
                Expanded(
                  flex: 60,
                  child: Column(
                    children: [
                      CharacterChoice(
                          callback: (classType) {
                            setState(() {
                              isLoading = true;
                              _future = display.getExotics(classType);
                              isLoading = false;
                            });
                          },
                          width:
                              MediaQuery.of(context).size.width - padding * 2),
                      FutureBuilder(
                          future: _future,
                          builder: (context,
                              AsyncSnapshot<
                                      List<DestinyInventoryItemDefinition>>
                                  snapshot) {
                            if (snapshot.hasData) {
                              list = <Widget>[];
                              for (var i = 0; i < snapshot.data!.length; i++) {
                                list.add(Padding(
                                  padding: EdgeInsets.all(itemPadding / 2),
                                  child: InkWell(
                                      onTap: () => {
                                            StorageService.setLocalStorage(
                                                "exotic", snapshot.data![i]),
                                            Navigator.pushNamed(
                                                context, routeFilter,
                                                arguments:
                                                    snapshot.data![i].hash)
                                          },
                                      child: NamedItem(
                                          width: itemSize,
                                          value: snapshot.data![i])),
                                ));
                              }
                              return Wrap(
                                alignment: WrapAlignment.center,
                                children: list,
                              );
                            } else {
                              return const Loader();
                            }
                          }),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget mobileView() {
    bool isLoading = false;
    String searchName = "";
    double sideTextPadding = 0;
    double padding = MediaQuery.of(context).size.width * 0.025;
    double tooltipSize = 30;

    return FutureBuilder(
        future: _future,
        builder: (context,
            AsyncSnapshot<List<DestinyInventoryItemDefinition>> snapshot) {
          if (snapshot.hasData) {
            List<DestinyInventoryItemDefinition> filteredData =
                searchName.isEmpty
                    ? snapshot.data!
                    : snapshot.data!
                        .where((item) => item.displayProperties!.name!
                            .toLowerCase()
                            .contains(searchName.toLowerCase()))
                        .toList();
            return SingleChildScrollView(
              child: Container(
                color: backgroundColor,
                padding: EdgeInsets.only(
                    top: padding, left: padding, right: padding),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontSize: titleFontSize),
                      ),
                    ),
                    Tooltip(
                        message: subtitle,
                        textStyle: TextStyle(
                          fontSize: textFontSize,
                          color: Colors.white,
                        ),
                        triggerMode: TooltipTriggerMode.tap,
                        child: Icon(Icons.info_outline_rounded,
                            size: tooltipSize, color: Colors.white)),
                    CharacterChoice(
                        callback: (classType) {
                          setState(() {
                            isLoading = true;
                            _future = display.getExotics(classType);
                            isLoading = false;
                          });
                        },
                        width: MediaQuery.of(context).size.width - padding * 2),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: itemPadding),
                      child: SearchBar((searchValue) {
                        setState(() {
                          isLoading = true;
                        });
                        Timer(const Duration(milliseconds: 100), () {
                          setState(() {
                            isLoading = false;
                            searchName = searchValue;
                          });
                        });
                      }),
                    ),
                    if (isLoading)
                      const Loader()
                    else
                      SizedBox(
                        width: MediaQuery.of(context).size.width - padding * 2,
                        child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              for (final item in filteredData)
                                Padding(
                                  padding: EdgeInsets.all(itemPadding / 2),
                                  child: InkWell(
                                      onTap: () => {
                                            Navigator.pushNamed(
                                                context, routeFilter,
                                                arguments: item.hash)
                                          },
                                      child: NamedItem(
                                          width: itemSize,
                                          value: item,
                                          sideTextPadding: sideTextPadding)),
                                )
                            ]),
                      )
                  ],
                ),
              ),
            );
          } else {
            return const Loader();
          }
        });
  }
}
