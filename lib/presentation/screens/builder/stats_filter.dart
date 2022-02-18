import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/cubit/filter_cubit.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/presentation/components/misc/button.dart';
import 'package:quria/presentation/screens/builder/components/filter.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/var/routes.dart';

class StatsFilterWidget extends StatefulWidget {
  final int exoticHash;
  const StatsFilterWidget({Key? key, required this.exoticHash})
      : super(key: key);

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
    Map<String, dynamic>? args;
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
              Row(
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
                    child: BlocProvider(
                      create: (context) => FilterCubit(),
                      child: BlocBuilder<FilterCubit, FilterState>(
                        builder: (context, filterState) {
                          return Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      top: (MediaQuery.of(context).size.width /
                                              100) *
                                          2),
                                  child: const FilterWidget()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(
                                          (MediaQuery.of(context).size.width /
                                                  100) *
                                              0.5),
                                      child: InkWell(
                                        onTap: () => {
                                          if (filterState is FilterDataState)
                                            {
                                              args = {
                                                "exoticHash": widget.exoticHash,
                                                "filter": filterState.data,
                                              },
                                            }
                                          else
                                            {
                                              args = {
                                                "exoticHash": widget.exoticHash,
                                                "filter": [
                                                  'Mobilité',
                                                  'Résistance',
                                                  'Récupération',
                                                  'Discipline',
                                                  'Intelligence',
                                                  'Force'
                                                ],
                                              },
                                            },
                                          Navigator.pushNamed(
                                              context, routeBuilder,
                                              arguments: args)
                                        },
                                        child: const Button(
                                            width: 250.0,
                                            height: 60,
                                            value: "Next step"),
                                      )),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
