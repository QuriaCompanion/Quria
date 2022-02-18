import 'package:flutter/material.dart';

@immutable
class SearchBar extends StatelessWidget {
  const SearchBar(this.onChange, {Key? key}) : super(key: key);
  final SearchValueCallback onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Recherche...',
            hintStyle: TextStyle(color: Colors.black)),
        onChanged: onChange);
  }
}

typedef SearchValueCallback = void Function(String searchValue);
