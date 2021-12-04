import 'package:flutter/material.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/button.dart';

class BuilderWidget extends StatelessWidget {
  final ManifestService manifest = ManifestService();
  BuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            download(context);
          },
          child: const Button(
              value: 'Download Manifest', width: 250.0, height: 60),
        ),
      ),
    );
  }

  void download(BuildContext context) async {
    final bool test = await manifest.download();
    print(test);
  }
}
