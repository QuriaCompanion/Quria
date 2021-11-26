import 'dart:convert';
import 'dart:developer';
import 'package:bungie_api/models/destiny_character_response.dart';
import 'package:http/http.dart' as http;

class TestService {
  final bungieUrl = "localhost://3000/";
  Future<DestinyCharacterResponse> requestToken(String code) async {
    var res = await http.get(Uri.parse(bungieUrl + "Response"));

    DestinyCharacterResponse response =
        DestinyCharacterResponse.fromJson(jsonDecode(res.body));
    inspect(response);
    return response;
  }
}
