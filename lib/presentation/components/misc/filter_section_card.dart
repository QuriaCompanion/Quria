import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class FilterSectionCard extends StatelessWidget {
  final List<Widget> children;
  final String title;
  const FilterSectionCard({Key? key, required this.children, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isMobile(context) ? Colors.transparent : blackLight,
      ),
      padding: isMobile(context) ? EdgeInsets.zero : EdgeInsets.all(globalPadding(context) / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textH2(title, utf8: false),
          SizedBox(height: globalPadding(context) / 2),
          SizedBox(
            width: isMobile(context) ? vw(context) * 0.5 : 350,
            child: Center(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: children,
              ),
            ),
          )
        ],
      ),
    );
  }
}
