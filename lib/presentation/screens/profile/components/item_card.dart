import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  // style
  final fontColor = Colors.white;
  final fontWeight = FontWeight.w900;
  // data
  final String itemCategory;
  final String itemName;
  final String itemImg;
  final int quantityByCategory;
  final int itemPower;
  final String itemType;

  const ItemCard({
    Key? key,
    required this.itemCategory,
    required this.itemName,
    required this.itemImg,
    required this.quantityByCategory,
    required this.itemPower,
    required this.itemType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.black,
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    itemCategory,
                    style: TextStyle(color: fontColor, fontWeight: fontWeight),
                  ),
                  const SizedBox(width: 20),
                  Text('$quantityByCategory/10',
                      style: const TextStyle(
                          color: Color.fromRGBO(137, 140, 148, 1)))
                ],
              ),
              Text('Tout voir', style: TextStyle(color: fontColor))
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
                width: 56,
                height: 56,
                child: Image.asset('assets/img/flutter-logo.png')),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemName,
                    style: TextStyle(color: fontColor, fontWeight: fontWeight)),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(right: 5),
                        child: Image.asset('assets/img/flutter-logo.png')),
                    Text(itemPower.toString(),
                        style: TextStyle(
                            color: fontColor, fontWeight: fontWeight)),
                    Text(' | ',
                        style: const TextStyle(
                            color: Color.fromRGBO(40, 45, 56, 1))),
                    Text(itemType, style: TextStyle(color: fontColor)),
                  ],
                )
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_drop_down_sharp,
              color: fontColor,
            )
          ],
        )
      ]),
    );
  }
}
