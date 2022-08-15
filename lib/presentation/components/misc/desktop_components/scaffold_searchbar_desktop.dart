import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/desktop_components/appbar_desktop_default.dart';
import 'package:quria/presentation/components/misc/filter_section_drawer.dart';
import 'package:quria/presentation/var/keys.dart';

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
      key: filterScaffoldKey,
      backgroundColor: black,
      endDrawer: const FilterSectionDrawer(),
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          filterScaffoldKey.currentState!.openEndDrawer();
        },
        child: SvgPicture.asset(
          "assets/icons/filter.svg",
          color: grey,
          width: 36,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        flexibleSpace: Builder(
          builder: (context) {
            return AppbarDesktopDefault(currentRoute: currentRoute);
          },
        ),
      ),
      body: SingleChildScrollView(child: body),
    );
  }
}
