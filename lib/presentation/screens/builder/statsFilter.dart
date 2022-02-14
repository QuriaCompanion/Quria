import 'package:flutter/material.dart';
import 'package:quria/presentation/components/button.dart';
import 'package:quria/presentation/screens/builder/components/filter.dart';
import 'package:quria/constants/styles.dart';

class StatsFilterWidget extends StatefulWidget {
  const StatsFilterWidget({Key? key}) : super(key: key);

  @override
  _StatsFilterWidgetState createState() => _StatsFilterWidgetState();
}

class _StatsFilterWidgetState extends State<StatsFilterWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double textFontSize = 25;
    const double titleFontSize = 45;
    const double padding = 50;
    const double itemPadding = 60;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ghostBackground,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: (MediaQuery.of(context).size.width / 100) * 5,
              left: (MediaQuery.of(context).size.width / 100) * 5,
              right: (MediaQuery.of(context).size.width / 100) * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sélectionner votre filtre",
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
                      // child: Text('TOTO'),
                      child: Column(
                        children: [
                          const FilterWidget(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.width /
                                              100) *
                                          2.5),
                                  child: const Button(
                                      width: 250.0,
                                      height: 60,
                                      value: "Next step")),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
