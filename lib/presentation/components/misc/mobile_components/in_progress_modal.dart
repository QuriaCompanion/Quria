import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class InProgressModal extends StatelessWidget {
  const InProgressModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: vh(context) * 0.5,
        decoration: const BoxDecoration(
          color: black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(globalPadding(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textH2("Transferer"),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: blackLight,
                    child: Icon(Icons.clear, size: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: blackLight,
            height: globalPadding(context),
            thickness: 1,
          ),
          Center(
            child: textBodyBold("Ca arrive bientot!"),
          )
        ]));
  }
}
