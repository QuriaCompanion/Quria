import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_body.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_header.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_type_card.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profile_mobile_header.dart';

class CollectionMobileView extends StatefulWidget {
  const CollectionMobileView({Key? key}) : super(key: key);

  @override
  State<CollectionMobileView> createState() => _CollectionMobileViewState();
}

class _CollectionMobileViewState extends State<CollectionMobileView> {
  late String collectionSelected;
  @override
  void initState() {
    super.initState();
    collectionSelected = 'Armes';
  }

  @override
  Widget build(BuildContext context) {
    double cardMargin = 8;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        mobileHeader(
          context,
          image: buildHeader,
          child: Text('dsds'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(bottom: vh(context) * 0.05),
                  child: textH1(collectionSelected)),
              CollectionMobileBody(collectionSelected: collectionSelected),
            ],
          ),
        )
      ],
    );
  }
}
