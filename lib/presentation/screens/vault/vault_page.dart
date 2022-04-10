import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/vaultHelper.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_characters.dart';
import 'package:quria/presentation/screens/vault/vault_mobile_view.dart';

class VaultPage extends StatefulWidget {
  const VaultPage({Key? key}) : super(key: key);

  @override
  State<VaultPage> createState() => _VaultPageState();
}

class _VaultPageState extends State<VaultPage> {
  late Future<VaultHelper> _future;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _future = DisplayService().getVault();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot<VaultHelper> snapshot) {
          if (snapshot.hasData) {
            if (vw(context) < 850) {
              return ScaffoldCharacters(
                  onCharacterChange: (newIndex) {
                    setState(() {
                      index = newIndex;
                    });
                  },
                  characters: snapshot.data!.characters,
                  selectedCharacterIndex: index,
                  body: VaultMobileView(data: snapshot.data!));
            } else {
              return Container();
            }
          } else {
            return Container(
                height: vh(context),
                width: vw(context),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: splashBackground)),
                child: Loader(
                  splashColor: Colors.transparent,
                  animationSize: vw(context) * 0.5,
                ));
          }
        });
  }
}
