import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class InspectMobileActions extends StatefulWidget {
  const InspectMobileActions({Key? key}) : super(key: key);

  @override
  State<InspectMobileActions> createState() => _InspectMobileActionsState();
}

class _InspectMobileActionsState extends State<InspectMobileActions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: globalPadding(context) / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: SizedBox(
              height: vw(context) * 0.2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(
                          angle: -math.pi / 4,
                          child: Container(
                            height: (vw(context) * 0.12) - 5,
                            width: (vw(context) * 0.12) - 5,
                            decoration: const BoxDecoration(
                              color: blackLight,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: -math.pi / 4,
                          child: Container(
                            height: vw(context) * 0.12,
                            width: vw(context) * 0.12,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/Transfer.svg",
                          height: vw(context) * 0.06,
                          width: vw(context) * 0.06,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    textBodyMedium("TransfÃ©rer"),
                  ]),
            ),
          ),
          InkWell(
            child: SizedBox(
              height: vw(context) * 0.2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(
                          angle: -math.pi / 4,
                          child: Container(
                            height: (vw(context) * 0.12) - 5,
                            width: (vw(context) * 0.12) - 5,
                            decoration: const BoxDecoration(
                              color: blackLight,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: -math.pi / 4,
                          child: Container(
                            height: vw(context) * 0.12,
                            width: vw(context) * 0.12,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/Share.svg",
                          height: vw(context) * 0.06,
                          width: vw(context) * 0.06,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    textBodyMedium("Partager"),
                  ]),
            ),
          ),
          InkWell(
            child: SizedBox(
              height: vw(context) * 0.2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(
                          angle: -math.pi / 4,
                          child: Container(
                            height: (vw(context) * 0.12) - 5,
                            width: (vw(context) * 0.12) - 5,
                            decoration: const BoxDecoration(
                              color: blackLight,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: -math.pi / 4,
                          child: Container(
                            height: vw(context) * 0.12,
                            width: vw(context) * 0.12,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/Collection.svg",
                          height: vw(context) * 0.06,
                          width: vw(context) * 0.06,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    textBodyMedium("Collection"),
                  ]),
            ),
          ),
          InkWell(
            child: SizedBox(
              height: vw(context) * 0.2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(
                          angle: -math.pi / 4,
                          child: Container(
                            height: (vw(context) * 0.12) - 5,
                            width: (vw(context) * 0.12) - 5,
                            decoration: const BoxDecoration(
                              color: blackLight,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: -math.pi / 4,
                          child: Container(
                            height: vw(context) * 0.12,
                            width: vw(context) * 0.12,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icons/Equip.svg",
                          height: vw(context) * 0.06,
                          width: vw(context) * 0.06,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    textBodyMedium("Ãquiper"),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
