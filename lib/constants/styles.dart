import 'package:flutter/material.dart';

const TextStyle kPageTitleStyle = TextStyle(fontSize: 10.0);

const Color black = Color(0xFF0C0E13);
const Color blackLight = Color(0xFF191C24);
const Color yellow = Color(0xFFF7D04D);
const Color legend = Color(0xFF53306A);
const Color crucible = Color(0xFFB63A32);
const Color vanguard = Color(0xFF1373F4);
const Color grey = Color(0xFF282D38);
const Color greyLight = Color(0xFF898C94);
const Color blueEquipped = Color(0xFF59A1E7);

const Color solar = Color(0xFF753D24);

const statisticHeader = AssetImage("assets/img/Stats.png");
const exoticHeader = AssetImage("assets/img/Exotic.png");
const subclassHeader = AssetImage("assets/img/Subclass.png");
const modsHeader = AssetImage("assets/img/mods.png");
const buildHeader = AssetImage("assets/img/build.png");
const collectionHeader = AssetImage("assets/img/collection.png");
const splashBackground = AssetImage("assets/img/base_background.png");
const splashBackgroundWeb = AssetImage("assets/img/splash_large.png");

double globalPadding(BuildContext context) {
  return vw(context) * 0.04266;
}

double mobileItemSize(BuildContext context) {
  return (vw(context) - (globalPadding(context) * 6)) / 5;
}

double vw(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double vh(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double appBarItem(BuildContext context) {
  return vw(context) * 0.064;
}

double appBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top +
      (globalPadding(context) * 2) +
      appBarItem(context);
}

const Color backgroundColor = black;
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
const hr = Divider(
  color: blackLight,
  height: 22,
  thickness: 1,
);
const divider =
    Text(' | ', style: TextStyle(color: Color.fromRGBO(40, 45, 56, 1)));

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
const BoxDecoration ghostBackground = BoxDecoration(color: black);
