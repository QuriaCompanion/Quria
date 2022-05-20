import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';

class BuilderWidget extends StatefulWidget {
  final BuilderPreparation data;
  const BuilderWidget({Key? key, required this.data}) : super(key: key);

  @override
  BuilderWidgetState createState() => BuilderWidgetState();
}

class BuilderWidgetState extends State<BuilderWidget> {
  late Future<List<Build>> _future;
  final manifest = ManifestService();
  double singleBuildWidth = 600;
  @override
  void initState() {
    super.initState();

    _future = BuilderService().calculateBuilds(
      data: widget.data,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 600) {
      double sidePadding = vw(context) * 0.025;
      singleBuildWidth = vw(context) - sidePadding * 2;
    }
    return SizedBox(
      width: vw(context),
      child: FutureBuilder(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot<List<Build>> snapshot) {
            if (snapshot.hasData) {
              List<Widget> list = <Widget>[];
              list.add(const SizedBox(height: 25));
              // for (var i = 0; i < snapshot.data!.length; i++) {
              //   list.add(SingleBuild(
              //       width: singleBuildWidth, buildInfo: snapshot.data![i]));
              // }
              return ListView(
                children: list,
              );
            } else {
              return Container(
                decoration: greyTransparentBackground,
                child: const Loader(
                    waitingMessage:
                        'Veuillez patienter nous recherchons les meilleurs builds pour vous!'),
              );
            }
          }),
    );
  }
}
