import 'package:flutter/material.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/presentation/screens/builder/components/extended_builder_misc.dart';

class ExtendedBuilderInfo extends StatefulWidget {
  final Build buildInfo;
  final double fontSize;
  final double padding;
  const ExtendedBuilderInfo(
      {required this.buildInfo,
      this.fontSize = 25,
      this.padding = 15,
      Key? key})
      : super(key: key);

  @override
  _ExtendedBuilderInfoState createState() => _ExtendedBuilderInfoState();
}

class _ExtendedBuilderInfoState extends State<ExtendedBuilderInfo> {
  bool isVisible = false;
  IconData icon = Icons.arrow_downward_outlined;
  @override
  Widget build(BuildContext context) {
    List<Widget> listMod = <Widget>[];
    for (var i = 0; i < widget.buildInfo.mod.length; i++) {
      listMod.add(ExtendedBuilderMisc(miscData: widget.buildInfo.mod[i]));
    }
    List<Widget> listMaterial = <Widget>[];
    for (var i = 0; i < widget.buildInfo.material.length; i++) {
      listMaterial
          .add(ExtendedBuilderMisc(miscData: widget.buildInfo.material[i]));
    }
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() => isVisible = !isVisible);
            setState(() => icon = isVisible
                ? Icons.arrow_upward_outlined
                : Icons.arrow_downward_outlined);
          },
          child: Icon(
            icon,
            color: Colors.white70,
            size: 45.0,
          ),
        ),
        if (isVisible)
          Column(
            children: [
              const Divider(
                color: Colors.white,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Padding(
                  padding: EdgeInsets.all(widget.padding),
                  child: Text('Mods à équiper',
                      style: TextStyle(
                          color: Colors.white70, fontSize: widget.fontSize)),
                ),
                Text('Matériaux nécessaire',
                    style: TextStyle(
                        color: Colors.white70, fontSize: widget.fontSize)),
              ]),
              Row(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 45,
                      child: Column(
                        textDirection: TextDirection.ltr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: listMod,
                      ),
                    ),
                    const Expanded(flex: 10, child: SizedBox()),
                    Expanded(
                      flex: 45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.ltr,
                        children: listMaterial,
                      ),
                    )
                  ])
            ],
          ),
      ],
    );
  }
}
