import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/desktop_components/appbar_desktop_default.dart';

class ScaffoldDesktop extends StatefulWidget {
  final Widget body;
  final String currentRoute;

  const ScaffoldDesktop({required this.body, Key? key, required this.currentRoute}) : super(key: key);

  @override
  State<ScaffoldDesktop> createState() => _ScaffoldDesktopState();
}

class _ScaffoldDesktopState extends State<ScaffoldDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: AppbarDesktopDefault(currentRoute: widget.currentRoute)),
        body: SingleChildScrollView(child: widget.body));
  }
}
