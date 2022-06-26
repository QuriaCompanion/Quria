import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';

class ErrorDialog extends StatelessWidget {
  final String? errorMessage;
  final Widget? child;
  const ErrorDialog({
    this.errorMessage,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String error = errorMessage ?? AppLocalizations.of(context)!.error_base;
    return Center(
      child: Container(
        height: 400,
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
              textH3(AppLocalizations.of(context)!.error_title, utf8: false),
              Center(
                child: textBodyRegular(error, utf8: false, center: true),
              ),
              if (child != null) child!,
              if (child == null)
                RoundedButton(
                  text: textBodyMedium(AppLocalizations.of(context)!.understood,
                      color: black),
                  onPressed: () => Navigator.pop(context),
                ),
              SizedBox(height: globalPadding(context)),
            ]),
      ),
    );
  }
}
