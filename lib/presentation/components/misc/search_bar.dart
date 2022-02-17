import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar(this.onChange);
  final SearchValueCallback onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: TextField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              border: OutlineInputBorder(),
              hintText: 'Recherche',
              hintStyle: TextStyle(color: Colors.white)),
          onChanged: onChange),
    );
  }
}

typedef SearchValueCallback = void Function(String searchValue);
