import 'package:flutter/material.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/Header/button.dart';

class HomeWidget extends StatelessWidget {
  final ManifestService manifest = ManifestService();
  HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QuriaCompanion"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            download(context);
          },
          child: Button(
            value: 'download Manifest',
          ),
        ),
      ),
    );
  }

  void download(BuildContext context) async {
    final bool test = await manifest.download();
    print(test);
  }
}
