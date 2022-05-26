import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;
  final Widget? child;
  const ErrorDialog({
    this.errorMessage =
        "Une erreur est surevenue, veuillez réessayer plus tard",
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: vw(context) * 0.75,
        decoration: const BoxDecoration(
          color: blackLight,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image(image: AssetImage('assets/img/error.png'))),
              textH3("Aïe, coup dur", utf8: false),
              Center(
                child: textBodyRegular(errorMessage, utf8: false, center: true),
              ),
              if (child != null) child!,
              if (child == null)
                RoundedButton(
                  text: textBodyMedium("C'est compris", color: black),
                  onPressed: () => Navigator.pop(context),
                ),
              SizedBox(height: globalPadding(context)),
            ]),
      ),
    );
  }
}
