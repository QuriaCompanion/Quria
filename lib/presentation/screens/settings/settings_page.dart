import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger.dart';
import 'package:quria/presentation/screens/settings/settings_mobile_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldBurger(
      body: SettingsMobileView(
        height: vh(context),
      ),
    );
  }
}
