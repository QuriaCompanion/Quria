import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@immutable
class SearchBar extends StatelessWidget {
  const SearchBar(this.onChange, {Key? key}) : super(key: key);
  final SearchValueCallback onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: AppLocalizations.of(context)!.searching,
            hintStyle: const TextStyle(color: Colors.white)),
        onChanged: onChange);
  }
}

typedef SearchValueCallback = void Function(String searchValue);
