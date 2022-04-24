import 'package:flutter/material.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_content.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_type_card.dart';

class CollectionMobileBody extends StatefulWidget {
  final String collectionSelected;

  const CollectionMobileBody({Key? key, required this.collectionSelected})
      : super(key: key);

  @override
  State<CollectionMobileBody> createState() => _CollectionMobileBodyState();
}

class _CollectionMobileBodyState extends State<CollectionMobileBody> {
  @override
  Widget build(BuildContext context) {
    double cardMargin = 8;
    if (widget.collectionSelected != '') {
      return const CollectionMobileContent(
        categories: ['category 1', 'category 1', 'category 1'],
      );
    } else {
      return Column(
        children: [
          Row(children: [
            const CollectionMobileTypeCard(
                logo: 'test', title: 'Armes', number: 100, total: 200),
            SizedBox(width: cardMargin),
            const CollectionMobileTypeCard(
                logo: 'test', title: 'Armes', number: 100, total: 200),
          ]),
          SizedBox(height: cardMargin),
          Row(children: [
            const CollectionMobileTypeCard(
                logo: 'test', title: 'Armes', number: 100, total: 200),
            SizedBox(width: cardMargin),
            const CollectionMobileTypeCard(
                logo: 'test', title: 'Armes', number: 100, total: 200),
          ]),
        ],
      );
    }
  }
}
