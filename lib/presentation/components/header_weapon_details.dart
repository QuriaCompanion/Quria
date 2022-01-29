import 'dart:developer';

import 'package:flutter/material.dart';

class HeaderWeaponDetails extends StatelessWidget {
  final String name;
  final String typeOfAmmo;
  final String typeOfAmmoImg;
  final String typeOfWeapon;
  final String type;
  final String typeImg;
  final int value;
  const HeaderWeaponDetails(
      {Key? key,
      required this.name,
      required this.typeOfAmmo,
      required this.typeOfAmmoImg,
      required this.typeOfWeapon,
      required this.type,
      required this.typeImg,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Image(
                        image: NetworkImage(typeImg),
                        width: 20,
                        height: 20,
                      ),
                      Text(name)
                    ],
                  ),
                  Text(typeOfWeapon)
                ],
              ),
              const Spacer(),
              Text('$value')
            ],
          ),
          Row(
            children: [
              Image(
                image: NetworkImage(typeOfAmmoImg),
                width: 20,
                height: 20,
              ),
              Text(typeOfAmmo)
            ],
          ),
        ],
      ),
    );
  }
}
