import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/Donator.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';

class LegendsPage extends StatefulWidget {
  const LegendsPage({Key? key}) : super(key: key);

  @override
  State<LegendsPage> createState() => _LegendsPageState();
}

class _LegendsPageState extends State<LegendsPage> {
  late Future<List<Donator>> _future;

  @override
  void initState() {
    super.initState();
    _future = DisplayService.fetchDonators();
  }

  @override
  Widget build(BuildContext context) {
    const divider = Divider(color: greyLight);
    return FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot<List<Donator>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(child: textH1("Hall of Fame")),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.clear, size: 20, color: black),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.design_services,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('Franck Lennon', utf8: false),
                  subtitle: textBodyMedium(AppLocalizations.of(context)!.designer, utf8: false),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.computer_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('Quentin Fle', utf8: false),
                  subtitle: textBodyMedium(AppLocalizations.of(context)!.developer, utf8: false),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.computer_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('Rémy Pachoncinski', utf8: false),
                  subtitle: textBodyMedium(AppLocalizations.of(context)!.developer, utf8: false),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.computer_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('Yannis Battiston', utf8: false),
                  subtitle: textBodyMedium(AppLocalizations.of(context)!.developer, utf8: false),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.rate_review,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('Jean-Michel Osiris', utf8: false),
                  subtitle: textBodyMedium(AppLocalizations.of(context)!.weapon_specialist, utf8: false),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.rate_review,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('Paranoiiak', utf8: false),
                  subtitle: textBodyMedium(AppLocalizations.of(context)!.weapon_specialist, utf8: false),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('@albertcarsan'),
                  subtitle: textBodyMedium(AppLocalizations.of(context)!.translator, utf8: false),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('@Matt_Erry'),
                  subtitle: textBodyMedium(AppLocalizations.of(context)!.translator, utf8: false),
                ),
                divider,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: textH3(AppLocalizations.of(context)!.donors, utf8: false)),
                ),
                Center(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1.7,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        textBodyMedium(snapshot.data![index].supporterName, utf8: false),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.coffee,
                              size: 15,
                              color: Colors.white,
                            ),
                            textBodyMedium(" x${snapshot.data![index].supportCoffees}", utf8: false),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const Loader(
            splashColor: Colors.transparent,
          );
        });
  }
}
