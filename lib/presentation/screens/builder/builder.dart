import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/backend/bungie_backend_api.service.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/screens/builder/components/single_build.dart';

class BuilderWidget extends StatefulWidget {
  final Map<String, dynamic> data;
  const BuilderWidget({Key? key, required this.data}) : super(key: key);

  @override
  _BuilderWidgetState createState() => _BuilderWidgetState();
}

class _BuilderWidgetState extends State<BuilderWidget> {
  final BackendService _backendService = BackendService();
  late Future<BuildResponse> _future;
  final manifest = ManifestService();

  @override
  void initState() {
    super.initState();
    _future = _backendService.getBuilds(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: _future,
          builder:
              (BuildContext context, AsyncSnapshot<BuildResponse?> snapshot) {
            if (snapshot.hasData) {
              List<Widget> list = <Widget>[];
              list.add(const SizedBox(height: 25));
              for (var i = 0; i < snapshot.data!.builds.length; i++) {
                list.add(SingleBuild(buildInfo: snapshot.data!.builds[i]));
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
