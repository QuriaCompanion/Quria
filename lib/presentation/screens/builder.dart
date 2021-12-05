import 'package:flutter/material.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class BuilderWidget extends StatelessWidget {
  final ManifestService manifest = ManifestService();
  BuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return singleBuild(context);
  }

  Widget singleBuild(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Base: T32'), Text('Final: T38')]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                              "https://www.bungie.net/common/destiny2_content/icons/e26e0e93a9daf4fdd21bf64eb9246340.png"),
                          Text('32')
                        ],
                      ),
                      Row(
                        children: [
                          Image.network(
                              "https://www.bungie.net/common/destiny2_content/icons/202ecc1c6febeb6b97dafc856e863140.png"),
                          Text('32')
                        ],
                      ),
                      Row(
                        children: [
                          Image.network(
                              "https://www.bungie.net/common/destiny2_content/icons/128eee4ee7fc127851ab32eac6ca91cf.png"),
                          Text('32')
                        ],
                      ),
                      Row(
                        children: [
                          Image.network(
                              "https://www.bungie.net/common/destiny2_content/icons/ca62128071dc254fe75891211b98b237.png"),
                          Text('32')
                        ],
                      ),
                      Row(
                        children: [
                          Image.network(
                              "https://www.bungie.net/common/destiny2_content/icons/e26e0e93a9daf4fdd21bf64eb9246340.png"),
                          Text('32')
                        ],
                      ),
                      Row(
                        children: [
                          Image.network(
                              "https://www.bungie.net/common/destiny2_content/icons/c7eefc8abbaa586eeab79e962a79d6ad.png"),
                          Text('32')
                        ],
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                          "https://www.bungie.net/common/destiny2_content/icons/7dda3e71787fa4ad24cfb4da6473699f.jpg"),
                      Image.network(
                          "https://www.bungie.net/common/destiny2_content/icons/cfc4daae1fce1889e37bcf40587e8917.jpg"),
                      Image.network(
                          "https://www.bungie.net/common/destiny2_content/icons/8b693256b3fb90a07eb670a63e5f8fe0.jpg"),
                      Image.network(
                          "https://www.bungie.net/common/destiny2_content/icons/ca7e484f9abf5fd60b6c70b7a5e1e6c4.jpg"),
                    ]),
              ]),
          decoration: BoxDecoration(
            color: Colors.red[400],
          ),
          padding: EdgeInsets.all(16),
          width: 600,
        ),
      ),
      width: 320,
      height: 240,
      color: Colors.grey[300],
    );
  }
}

class ExtendedData extends StatefulWidget {
  const ExtendedData({Key? key}) : super(key: key);

  @override
  _ExtendedDataState createState() => _ExtendedDataState();
}

class _ExtendedDataState extends State<ExtendedData> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
