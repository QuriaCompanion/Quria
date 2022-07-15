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

const ImageProvider<Object> statisticHeader = AssetImage("assets/img/Stats.png");
const ImageProvider<Object> exoticHeader = AssetImage("assets/img/Exotic.png");
const ImageProvider<Object> subclassHeader = AssetImage("assets/img/Subclass.png");
const ImageProvider<Object> modsHeader = AssetImage("assets/img/mods.png");
const ImageProvider<Object> buildHeader = AssetImage("assets/img/build.png");
const ImageProvider<Object> buildHeaderWeb = AssetImage("assets/img/builderWeb.png");
const ImageProvider<Object> ghostBuild = AssetImage("assets/img/ghostBuild.png");

const ImageProvider<Object> collectionHeader = AssetImage("assets/img/collection.png");
const ImageProvider<Object> splashBackground = AssetImage("assets/img/base_background.png");
const ImageProvider<Object> splashBackgroundWeb = AssetImage("assets/img/backgroundDesktop.jfif");

double globalPadding(BuildContext context) {
  if (vw(context) > 1000) {
    return vw(context) * 0.02;
  }
  return vw(context) * 0.04266;
}

double itemSize(BuildContext context, double width) {
  return (width - (globalPadding(context) * 6)) / 5;
}

double vw(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double iconSize(BuildContext context, double width) {
  return width / 6.69;
}

double desktopCharactersColumnSize(BuildContext context) {
  if (vw(context) > 1600) {
    return vw(context) * 0.4;
  }
  return vw(context) * 0.475;
}

double itemComponentDisplayTextWidth(BuildContext context, double width) {
  if (vw(context) > 1000) {
    return width - (iconSize(context, width) * 2) - globalPadding(context);
  }
  return width - (iconSize(context, width) * 2) - globalPadding(context) * 3;
}

double vh(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double appBarItem(BuildContext context) {
  return vw(context) * 0.064;
}

double appBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top + (globalPadding(context) * 2) + appBarItem(context);
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
const divider = Text(' | ', style: TextStyle(color: Color.fromRGBO(40, 45, 56, 1)));

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
const String ghostLink = "https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg";
const BoxDecoration blackBackground = BoxDecoration(color: black);
