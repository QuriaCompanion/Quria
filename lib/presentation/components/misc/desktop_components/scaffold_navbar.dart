
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ScaffoldNavBar extends StatefulWidget {
  final child;

  const ScaffoldNavBar({required this.child, Key? key}) : super(key: key);

  @override
  State<ScaffoldNavBar> createState() => _ScaffoldNavBarState();
}

class _ScaffoldNavBarState extends State<ScaffoldNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 55, left: 40, right: 40),
          child: Container(
            decoration: BoxDecoration(color: Colors.cyan),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(children: [
                      NavBarButton(
                        name: 'Personnage',
                        icon: SvgPicture.asset("assets/icons/Perso-1.svg"),
                      ),
                      SizedBox(width: 40),
                      NavBarButton(
                        name: 'Builds',
                        icon: SvgPicture.asset("assets/icons/Builds.svg"),
                      ),
                      SizedBox(width: 40),
                      NavBarButton(
                        name: 'QuriaBuilder',
                        icon: SvgPicture.asset("assets/icons/Quria.svg"),
                      ),
                      SizedBox(width: 40),
                      NavBarButton(
                        name: 'Coffre',
                        icon: SvgPicture.asset("assets/icons/Coffre.svg"),
                      ),
                      SizedBox(width: 40),
                      NavBarButton(
                        name: 'Collections',
                        icon: SvgPicture.asset("assets/icons/Collection.svg"),
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      Container(
                          child: Column(
                        children: [
                          navBarCharacter(
                            score: '1232',
                            name: 'Chasseur',
                            icon: 'assets/img/error.png',
                          ),
                          navBarCharacter(
                            score: '1232',
                            name: 'Chasseur',
                            icon: 'assets/img/error.png',
                          ),
                          navBarCharacter(
                            score: '1232',
                            name: 'Chasseur',
                            icon: 'assets/img/error.png',
                          ),
                        ],
                      )),
                      // Text('Paramètres'),
                    ]),
                  ),
                ]),
          ),
        ),
        widget.child
      ]),
    );
  }
}

class navBarCharacter extends StatelessWidget {
  final String score;
  final String name;
  final String icon;
  const navBarCharacter({
    Key? key,
    required this.score,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(width: 32, height: 32, image: AssetImage(icon)),
        SizedBox(width: 8),
        Text(name),
        Image(
          width: 32,
          height: 32,
          image: NetworkImage(DestinyData.bungieLink +
              ManifestService
                  .manifestParsed
                  .destinyStatDefinition[StatsHash.power]!
                  .displayProperties!
                  .icon!),
          color: yellow,
          fit: BoxFit.cover,
        ),
        textBodyBold(score, color: yellow),
        const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
      ],
    );
  }
}

class NavBarButton extends StatefulWidget {
  final name;
  final icon;

  const NavBarButton({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  State<NavBarButton> createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          isHover ? BoxDecoration(border: Border(bottom: BorderSide())) : null,
      child: InkWell(
        onTap: () => {},
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                widget.icon,
                SizedBox(width: 4),
                textBodyBold(widget.name)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
