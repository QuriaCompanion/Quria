import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_characters.dart';
import 'package:quria/presentation/screens/builds/foreign/foreign_build_desktop_view.dart';
import 'package:quria/presentation/screens/builds/foreign/foreign_build_mobile_view.dart';

class ForeignBuildPage extends ConsumerStatefulWidget {
  final String id;
  const ForeignBuildPage({Key? key, required this.id}) : super(key: key);

  @override
  ForeignBuildPageState createState() => ForeignBuildPageState();
}

class ForeignBuildPageState extends ConsumerState<ForeignBuildPage> {
  late Future<BuildStored?> _future;

  @override
  void initState() {
    super.initState();
    _future = DisplayService.loadBuild(ref, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: ((context, AsyncSnapshot<BuildStored?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return Container();
            }
            if (isMobile(context)) {
              return ScaffoldCharacters(
                body: ForeignBuildMobileView(
                  foreignBuild: snapshot.data!,
                ),
              );
            } else {
              return ScaffoldDesktop(
                  currentRoute: "test",
                  body: ForeignBuildDesktopView(
                    foreignBuild: snapshot.data!,
                  ));
            }
          }
          return Container(
              height: vh(context),
              width: vw(context),
              decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: splashBackground)),
              child: Loader(
                splashColor: Colors.transparent,
                animationSize: vw(context) * 0.5,
              ));
        }));
  }
}
