import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class LoadingModal extends StatelessWidget {
  final String text1;
  final String text2;
  const LoadingModal({required this.text1, required this.text2, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blackLight,
        borderRadius: BorderRadius.circular(15),
      ),
      height: vh(context) * 0.2,
      child: Row(children: [
        Lottie.asset(
          'assets/animations/loader.json',
          height: vh(context) * 0.1,
          width: vh(context) * 0.1,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textH2(text1, utf8: false),
            textH3(text2, utf8: false),
          ],
        ),
      ]),
    );
  }
}
