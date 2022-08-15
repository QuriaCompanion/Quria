import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/desktop_components/appbar_desktop_search.dart';

class ScaffoldSearchbarDesktop extends StatelessWidget {
  final Widget body;
  final String currentRoute;
  const ScaffoldSearchbarDesktop({
    Key? key,
    required this.body,
    required this.currentRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        flexibleSpace: Builder(
          builder: (context) {
            return AppbarDesktopSearch(currentRoute: currentRoute);
          },
        ),
      ),
      body: SingleChildScrollView(child: body),
    );
  }
}
