import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_categories.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_item_section.dart';

class CollectionMobileContent extends StatefulWidget {
  final List<String> categories;

  const CollectionMobileContent({Key? key, required this.categories})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _CollectionMobileContentState();
}

class _CollectionMobileContentState extends State<CollectionMobileContent> {
  @override
  Widget build(BuildContext context) {
    double cardMargin = 8;
    return Column(children: [
      CollectionMobileCategories(
        categorySelected: 'category 1',
        categories: widget.categories,
      ),
      SizedBox(
        height: vh(context) * 0.05,
      ),
      Column(
        children: const [
          CollectionMobileItemSection(
            sectionName: 'test',
            number: 1,
            total: 10,
            items: ['sds', 'dsds'],
          ),
          CollectionMobileItemSection(
            sectionName: 'test',
            number: 1,
            total: 10,
            items: ['sds', 'dsds'],
          )
        ],
      ),
    ]);
  }
}
