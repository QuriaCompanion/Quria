import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget textH1(String child, {color = Colors.white, maxLines = 1}) {
  return AutoSizeText(
    utf8Decode(child),
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget textH2(String child, {color = Colors.white}) {
  return AutoSizeText(
    utf8Decode(child),
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Widget textH3(String child, {color = Colors.white}) {
  return AutoSizeText(
    utf8Decode(child),
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Widget textBodyBold(String child, {color = Colors.white}) {
  return AutoSizeText(
    utf8Decode(child),
    maxLines: 15,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Widget textBodyMedium(String child, {color = Colors.white}) {
  return AutoSizeText(
    utf8Decode(child),
    maxLines: 15,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Widget textBodyHighRegular(String child, {color = Colors.white}) {
  return AutoSizeText(
    utf8Decode(child),
    maxLines: 15,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Widget textBodyRegular(String child, {color = Colors.white}) {
  return AutoSizeText(
    utf8Decode(child),
    maxLines: 15,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Widget textCaptionBold(String child, {color = Colors.white}) {
  return AutoSizeText(
    utf8Decode(child),
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Widget textCaption(String child, {color = Colors.white}) {
  return AutoSizeText(
    utf8Decode(child),
    overflow: TextOverflow.ellipsis,
    maxLines: 15,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

String utf8Decode(String str) {
  return utf8.decode(str.runes.toList());
}
