import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class VaultMobileHeader extends StatelessWidget {
  final String name;

  const VaultMobileHeader({required this.name, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: vw(context) - (globalPadding(context) * 2),
            child: textH1(name, maxLines: 2)),
      ],
    );
  }
}
