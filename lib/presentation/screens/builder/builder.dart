import 'package:bungie_api/enums/destiny_class.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/screens/builder/components/single_build.dart';

class BuilderWidget extends StatefulWidget {
  const BuilderWidget({Key? key}) : super(key: key);

  @override
  _BuilderWidgetState createState() => _BuilderWidgetState();
}

class _BuilderWidgetState extends State<BuilderWidget> {
  late Future<List<Build>> _future;
  final manifest = ManifestService();

  @override
  void initState() {
    super.initState();

    _future = BuilderService().calculateBuilds(
        statOrder: [], classType: DestinyClass.Warlock, exoticHash: 3627185503);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot<List<Build>> snapshot) {
            if (snapshot.hasData) {
              List<Widget> list = <Widget>[];
              list.add(const SizedBox(height: 25));
              for (var i = 0; i < snapshot.data!.length; i++) {
                list.add(SingleBuild(buildInfo: snapshot.data![i]));
              }
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
