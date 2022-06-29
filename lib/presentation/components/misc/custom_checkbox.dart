import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class CustomCheckbox extends StatelessWidget {
  final String text;
  final bool value;
  final Function onChanged;
  const CustomCheckbox({
    required this.text,
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  final Duration duration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: globalPadding(context), vertical: globalPadding(context) / 1.5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: blackLight),
      child: GestureDetector(
        onTap: () {
          onChanged(!value);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: value ? yellow : Colors.white,
                    width: 1.5,
                  ),
                ),
                duration: duration,
                padding: const EdgeInsets.all(2),
                child: AnimatedContainer(
                  duration: duration,
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                    color: value ? yellow : Colors.transparent,
                  ),
                  width: 16,
                  height: 16,
                ),
              ),
            ),
            SizedBox(
              width: globalPadding(context),
            ),
            textBodyBold(text, utf8: false),
          ],
        ),
      ),
    );
  }
}
