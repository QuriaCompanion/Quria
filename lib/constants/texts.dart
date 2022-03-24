import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget textH1(String child) {
  return AutoSizeText(
    utf8Decode(child),
    style: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Widget textH2(String child) {
  return AutoSizeText(
    utf8Decode(child),
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  );
}

Widget textH3(String child) {
  return AutoSizeText(
    utf8Decode(child),
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  );
}

Widget textBodyBold(String child) {
  return AutoSizeText(
    utf8Decode(child),
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  );
}

Widget textBodyMedium(String child) {
  return AutoSizeText(
    utf8Decode(child),
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );
}

Widget textBodyRegular(String child) {
  return AutoSizeText(
    utf8Decode(child),
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  );
}

Widget textCaptionBold(String child) {
  return AutoSizeText(
    utf8Decode(child),
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  );
}

Widget textCaption(String child) {
  return AutoSizeText(
    utf8Decode(child),
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  );
}

String utf8Decode(String str) {
  return utf8.decode(str.runes.toList());
}
