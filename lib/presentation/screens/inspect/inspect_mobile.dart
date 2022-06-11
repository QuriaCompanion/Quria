import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/itemInfoHelper.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/inspect/inspect_item.dart';
import 'package:quria/presentation/var/keys.dart';

class MobileInspect extends StatefulWidget {
  final InspectData data;
  final double? width;
  const MobileInspect({
    required this.data,
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
    final ItemInfoHelper data =
        DisplayService().getItemInfo(widget.data.instanceId, widget.data.hash);
    return ScaffoldBurgerAndBackOption(
      key: scaffoldKey,
      width: width,
      body: SingleChildScrollView(
        child: InspectItem(
          width: width,
          data: data,
          inspectData: widget.data,
        ),
      ),
    );
  }
}
