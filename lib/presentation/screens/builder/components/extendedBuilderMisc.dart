import 'package:flutter/material.dart';
import 'package:quria/data/models/BuildResponse.model.dart';

class ExtendedBuilderMisc extends StatelessWidget {
  final Misc miscData;
  const ExtendedBuilderMisc({Key? key, required this.miscData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.ltr,
          children: [
            Image.network(miscData.icon),
            Text(miscData.name, style: TextStyle(color: Colors.white70)),
            Text('${miscData.number}', style: TextStyle(color: Colors.white70))
          ]),
    );
  }
}
