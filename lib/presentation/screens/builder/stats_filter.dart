import 'package:auto_size_text/auto_size_text.dart';
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

  double textFontSize = 25;
  double titleFontSize = 45;
  double padding = 50;
  String title = "Sélectionnez l'ordre de vos statistiques";
  String subtitle =
      "Continuons avec vos statistiques! \nQu'est ce qui vous ferait rêver? \nChoisissez les statsque vous désirez dans votre ordre de priorité. On s'occupe de trouver les items parfait pour vous!";

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 850) {
      return mobileView();
    } else {
      return desktopView();
    }
  }

  Widget mobileView() {
    double tooltipSize = 30;
    padding = MediaQuery.of(context).size.width * 0.025;
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - padding * 2,
            child: Center(
              child: AutoSizeText(
                title,
                maxLines: 2,
                minFontSize: 0,
                wrapWords: false,
                maxFontSize: titleFontSize,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
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
          BlocProvider(
            create: (context) => FilterCubit(),
            child: BlocBuilder<FilterCubit, FilterState>(
              builder: (context, filterState) {
                return Column(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width - padding * 2,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: const FilterWidget()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => {
                            setState(() {
                              BuilderPreparation args;
                              if (filterState is FilterDataState) {
                                args = BuilderPreparation(
                                    statOrder: filterState.data,
                                    exoticHash: widget.exoticHash);
                                Navigator.pushNamed(context, routeBuilder,
                                    arguments: args);
                              } else {
                                args = BuilderPreparation(statOrder: [
                                  'Mobilité',
                                  'Résistance',
                                  'Récupération',
                                  'Discipline',
                                  'Intelligence',
                                  'Force'
                                ], exoticHash: widget.exoticHash);

                                Navigator.pushNamed(context, routeBuilder,
                                    arguments: args);
                              }
                            })
                          },
                          child: const Button(
                              width: 250.0, height: 60, value: "Next step"),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget desktopView() {
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
                                          setState(() {
                                            BuilderPreparation args;
                                            if (filterState
                                                is FilterDataState) {
                                              args = BuilderPreparation(
                                                  statOrder: filterState.data,
                                                  exoticHash:
                                                      widget.exoticHash);
                                              Navigator.pushNamed(
                                                  context, routeBuilder,
                                                  arguments: args);
                                            } else {
                                              args = BuilderPreparation(
                                                  statOrder: [
                                                    'Mobilité',
                                                    'Résistance',
                                                    'Récupération',
                                                    'Discipline',
                                                    'Intelligence',
                                                    'Force'
                                                  ],
                                                  exoticHash:
                                                      widget.exoticHash);

                                              Navigator.pushNamed(
                                                  context, routeBuilder,
                                                  arguments: args);
                                            }
                                          })
                                        },
                                        child: const Button(
                                            width: 250.0,
                                            height: 60,
                                            value: "C'est parti !"),
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
