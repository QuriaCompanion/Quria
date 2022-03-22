import 'package:flutter/material.dart';

const TextStyle kPageTitleStyle = TextStyle(fontSize: 10.0);

const double globalPadding = 0.05;

BoxDecoration greyTransparentBackground = BoxDecoration(
  color: Colors.grey.withOpacity(0.3),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ],
);
BoxDecoration blackTransparentBackground = BoxDecoration(
  color: Colors.black54,
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ],
);
BoxDecoration regularShadow = BoxDecoration(
  color: Colors.grey.shade700,
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ],
);
const String ghostLink =
    "https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg";
const BoxDecoration ghostBackground = BoxDecoration(
    image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: NetworkImage(
            "https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg")));

const Color backgroundColor = Color.fromARGB(255, 109, 102, 92);
const Color black = Color(0xFF0C0E13);
const Color blackLight = Color(0xFF191C24);
const Color yellow = Color(0xFFF7D04D);
const Color legend = Color(0xFF53306A);
const Color crucible = Color(0xFFB63A32);
const Color vanguard = Color(0xFF1373F4);
const Color grey = Color(0xFF3B3F4A);
const Color blueEquipped = Color(0xFF59A1E7);
