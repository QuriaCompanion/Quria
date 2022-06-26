import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
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
  // TODO: move the text to localisation file

  @override
  Widget build(BuildContext context) {
    const divider = Divider(color: Colors.white);
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
                      const SizedBox(),
                      Center(child: textH1("Hall of Fame")),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const CircleAvatar(
                          backgroundColor: blackLight,
                          child:
                              Icon(Icons.clear, size: 20, color: Colors.white),
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
                  subtitle: textBodyMedium('Designer'),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.computer_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('Quentin Fle', utf8: false),
                  subtitle: textBodyMedium('Developer', utf8: false),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.computer_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('Rémy Pachoncinski', utf8: false),
                  subtitle: textBodyMedium('Developer:', utf8: false),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.computer_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('Yannis Battiston', utf8: false),
                  subtitle: textBodyMedium('Developer:', utf8: false),
                ),
                divider,
                ListTile(
                  leading: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: textBodyBold('@albertcarsan'),
                  subtitle:
                      textBodyMedium('Translator (spanish): ', utf8: false),
                ),
                divider,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: textH3("Donators")),
                ),
                for (Donator donator in snapshot.data!)
                  ListTile(
                    title: textBodyMedium(donator.supporterName, utf8: false),
                    subtitle: Row(
                      children: [
                        const Icon(
                          Icons.coffee,
                          size: 15,
                          color: Colors.white,
                        ),
                        textBodyMedium(donator.supportCoffees.toString(),
                            utf8: false),
                      ],
                    ),
                  ),
              ],
            );
          }
          return Container(
            height: vh(context),
            width: vw(context),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: splashBackground)),
            child: Loader(
              splashColor: Colors.transparent,
              animationSize: vw(context) * 0.5,
            ),
          );
        });
  }
}
