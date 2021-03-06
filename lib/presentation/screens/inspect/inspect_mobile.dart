import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/inspect/inspect_item.dart';

class MobileInspect extends StatefulWidget {
  final double? width;
  const MobileInspect({
    this.width,
    Key? key,
  }) : super(key: key);
  @override
  State<MobileInspect> createState() => _MobileInspectState();
}

@override
class _MobileInspectState extends State<MobileInspect> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = widget.width ?? vw(context);
    return ScaffoldBurgerAndBackOption(
      width: width,
      body: SingleChildScrollView(
        child: InspectItem(
          width: width,
        ),
      ),
    );
  }
}
