import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class ScaffoldNavBar extends StatelessWidget {
  final child;

  const ScaffoldNavBar({required this.child, Key? key}) : super(key: key);
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
                children: [
                  Container(
                    child: Row(children: [
                      NavBarButton(
                        name: 'Personnage',
                        widthPercent: vw(context) * 0.08,
                        icon: SvgPicture.asset("assets/icons/Perso-1.svg"),
                      ),
                      SizedBox(width: 40),
                      NavBarButton(
                        name: 'Builds',
                        widthPercent: vw(context) * 0.08,
                        icon: SvgPicture.asset("assets/icons/Builds.svg"),
                      ),
                      SizedBox(width: 40),
                      NavBarButton(
                        name: 'QuriaBuilder',
                        widthPercent: vw(context) * 0.08,
                        icon: SvgPicture.asset("assets/icons/Quria.svg"),
                      ),
                      SizedBox(width: 40),
                      NavBarButton(
                        name: 'Coffre',
                        widthPercent: vw(context) * 0.08,
                        icon: SvgPicture.asset("assets/icons/Coffre.svg"),
                      ),
                      SizedBox(width: 40),
                      NavBarButton(
                        name: 'Collections',
                        widthPercent: vw(context) * 0.08,
                        icon: SvgPicture.asset("assets/icons/Collection.svg"),
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      Container(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              // Image(
                              //     image:
                              //         AssetImage('assets/images/avatar.png')),
                              Text('Nom'),
                              Text('1494'),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Image(
                              // image:
                              // AssetImage('assets/images/avatar.png')),
                            ],
                          ),
                        ],
                      )),
                      Text('Paramètres'),
                    ]),
                  ),
                ]),
          ),
        ),
        child
      ]),
    );
  }
}

class NavBarButton extends StatefulWidget {
  final String name;
  final widthPercent;
  final icon;

  const NavBarButton({
    Key? key,
    required this.name,
    required this.widthPercent,
    required this.icon,
  }) : super(key: key);

  @override
  State<NavBarButton> createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  bool test = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {inspect('sds')},
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
          if (test)
            LinearPercentIndicator(
              animation: test,
              restartAnimation: false,
              animationDuration: 1000,
              width: widget.widthPercent,
              lineHeight: 5,
              percent: 1,
              backgroundColor: Colors.grey,
              progressColor: Colors.white,
            ),
        ],
      ),
    );
  }
}
