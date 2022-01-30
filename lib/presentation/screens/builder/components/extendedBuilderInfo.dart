import 'package:flutter/material.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/presentation/screens/builder/components/extendedBuilderMisc.dart';

class ExtendedData extends StatefulWidget {
  final Build buildInfo;
  const ExtendedData({required this.buildInfo, Key? key}) : super(key: key);

  @override
  _ExtendedDataState createState() => _ExtendedDataState();
}

class _ExtendedDataState extends State<ExtendedData> {
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Mods à équiper',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 15)),
                    ),
                    Text('Matériaux nécessaire',
                        style: TextStyle(color: Colors.white70, fontSize: 15)),
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
