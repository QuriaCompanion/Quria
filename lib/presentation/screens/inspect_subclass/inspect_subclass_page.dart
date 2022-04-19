import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_base.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';

import '../../../data/services/display/display.service.dart';

class InspectSubclassPage extends StatefulWidget {
  final String instanceId;
  const InspectSubclassPage({
    required this.instanceId,
    Key? key,
  }) : super(key: key);

  @override
  State<InspectSubclassPage> createState() => _InspectSubclassPageState();
}

class _InspectSubclassPageState extends State<InspectSubclassPage> {
  late SocketsHelper data;
  @override
  void initState() {
    super.initState();
    data = DisplayService().getSubclassMods(widget.instanceId);
  }

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 850) {
      return ScaffoldBase(
        body: SubclassModsMobileView(
          onChange: (mods) => {},
          sockets: data.sockets,
          subclass: data.def!,
        ),
      );
    } else {
      return Container();
    }
  }
}
