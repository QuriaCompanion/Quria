import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/Donator.model.dart';
import 'package:http/http.dart' as http;

class LegendsPage extends StatelessWidget {
  const LegendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      textBodyMedium('Designer:'),
      textBodyMedium('Name of the designer'),
      textBodyMedium('traductor:'),
      textBodyMedium('Name of the traductor'),
      textBodyMedium('Developpers:'),
      textBodyMedium('Names of the Developpers'),
      textBodyMedium('Donators:'),
      const DonatorList()
    ]);
  }
}

class DonatorList extends StatefulWidget {
  const DonatorList({Key? key}) : super(key: key);

  @override
  State<DonatorList> createState() => _DonatorListState();
}

class _DonatorListState extends State<DonatorList> {
  late Future<List<Donator>> futureDonators;

  @override
  void initState() {
    super.initState();
    futureDonators = fetchDonators();
  }

  Future<List<Donator>> fetchDonators() async {
    const token = 'addTokenHere';
    final response = await http.get(
        Uri.parse('https://developers.buymeacoffee.com/api/v1/supporters'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return Donator.fromJsonList(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Donator>>(
      future: futureDonators,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!.map((donator) {
              return Row(
                children: [
                  textBodyMedium(donator.supporterName,
                      color: Colors.white, utf8: false),
                  textBodyMedium(donator.supportCoffees.toString()),
                  const Icon(
                    Icons.coffee,
                    size: 15,
                    color: Colors.white,
                  )
                ],
              );
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
