import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

class SelectFilterType extends StatelessWidget {
  final String filterLogo;
  final double fontSizeFilter;
  final bool isCurrentFilter;
  final double width;
  const SelectFilterType(
      {Key? key,
      required this.filterLogo,
      required this.isCurrentFilter,
      required this.width,
      this.fontSizeFilter = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: blackLight,
        border: Border.all(
          color: isCurrentFilter ? Colors.white : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: Image(
            image: NetworkImage(filterLogo),
          ),
        ),
      ),
    );
  }
}
