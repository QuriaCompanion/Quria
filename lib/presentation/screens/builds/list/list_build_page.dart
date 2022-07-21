import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_characters.dart';
import 'package:quria/presentation/components/misc/page_loader.dart';
import 'package:quria/presentation/screens/builds/list/list_build_desktop.dart';
import 'package:quria/presentation/screens/builds/list/list_build_mobile.dart';
import 'package:quria/presentation/var/routes.dart';

class ListBuildPage extends StatefulWidget {
  const ListBuildPage({Key? key}) : super(key: key);

  @override
  State<ListBuildPage> createState() => _ListBuildPageState();
}

class _ListBuildPageState extends State<ListBuildPage> {
  late Future<List<BuildStored>> _future;
  @override
  void initState() {
    super.initState();
    _future = BuilderService().getBuilds();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: ((context, AsyncSnapshot<List<BuildStored>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<BuildStored> builds = snapshot.data ?? [];
          builds.sort((a, b) => b.date.compareTo(a.date));
          builds = builds
              .where((element) =>
                  element.className == Provider.of<CharactersProvider>(context).currentCharacter?.classType)
              .toList();
          if (vw(context) < 1000) {
            return ScaffoldCharacters(
                body: ListBuildMobile(
              builds: builds,
            ));
          }
          return ScaffoldDesktop(
            body: ListBuildDesktop(
              builds: builds,
            ),
            currentRoute: routeListBuilds,
          );
        } else {
          return const PageLoader();
        }
      }),
    );
  }
}
