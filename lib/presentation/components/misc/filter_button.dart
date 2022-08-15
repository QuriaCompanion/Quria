import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: const SizedBox(
        width: 56,
        child: Icon(
          Icons.filter_list,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
