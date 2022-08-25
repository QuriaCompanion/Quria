import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_searchbar_desktop.dart';
import 'package:quria/presentation/components/misc/filter_section_drawer.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';
import 'package:quria/presentation/components/misc/page_loader.dart';
import 'package:quria/presentation/screens/profile/profile_desktop_view.dart';
import 'package:quria/presentation/screens/vault/vault_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class VaultPage extends ConsumerStatefulWidget {
  const VaultPage({Key? key}) : super(key: key);

  @override
  VaultPageState createState() => VaultPageState();
}

class VaultPageState extends ConsumerState<VaultPage> {
  late Future<void> _future;

  @override
  void initState() {
    super.initState();
    _future = DisplayService.loadManifestAndProfile(ref);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> filterScaffoldKey = GlobalKey<ScaffoldState>();
    return FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (isMobile(context)) {
              return Scaffold(
                key: filterScaffoldKey,
                backgroundColor: black,
                drawer: const Burger(),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const FilterSectionDrawer();
                        });
                  },
                  child: SvgPicture.asset(
                    "assets/icons/filter.svg",
                    color: grey,
                    width: 36,
                  ),
                ),
                body: const VaultMobileView(),
              );
            } else {
              ProfileHelper data = DisplayService.getProfileData(ref);
              return ScaffoldSearchbarDesktop(
                currentRoute: routeProfile,
                body: ProfileDesktopView(
                  data: data,
                ),
              );
            }
          } else {
            return const PageLoader();
          }
        });
  }
}
