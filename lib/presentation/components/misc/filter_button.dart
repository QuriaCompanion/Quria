import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/filter_section_desktop.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showDialog(
            context: context,
            barrierColor: const Color.fromARGB(110, 0, 0, 0),
            builder: (context) {
              return Center(
                child: Container(
                    padding: const EdgeInsets.only(top: 56),
                    height: vh(context) - 56,
                    width: vw(context),
                    child: const SingleChildScrollView(child: FilterSectionDesktop())),
              );
            });
      },
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
