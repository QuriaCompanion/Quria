import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget textH1(String child, {color = Colors.white, utf8 = true, maxLines = 1}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget textH2(String child, {color = Colors.white, utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Widget textQuria(String child, {color = Colors.white, utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w300,
      color: color,
    ),
  );
}

Widget textCompanion(String child, {color = Colors.white, utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: color,
    ),
  );
}

Widget textConnect(String child, {color = Colors.white, utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Widget textH3(String child, {color = Colors.white, utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Widget textBodyBold(String child, {color = Colors.white, utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    maxLines: 15,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Widget textBodyMedium(String child, {color = Colors.white, utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    maxLines: 15,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Widget textBodyHighRegular(String child, {Color color = Colors.white, bool utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    maxLines: 15,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Widget textBodyRegular(String child, {color = Colors.white, utf8 = true, center = false}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    maxLines: 15,
    textAlign: center ? TextAlign.center : null,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Widget textCaptionBold(String child, {color = Colors.white, utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Widget textCaption(String child, {color = Colors.white, utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    overflow: TextOverflow.ellipsis,
    maxLines: 15,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Widget textIcon(String child, {color = Colors.white, utf8 = true}) {
  return AutoSizeText(
    utf8 ? utf8Decode(child) : child,
    overflow: TextOverflow.ellipsis,
    maxLines: 15,
    style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

String utf8Decode(String str) {
  return utf8.decode(str.runes.toList());
}
