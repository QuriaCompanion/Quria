import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  final Map<String, String> headers = {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  };

  final baseUrl = "http://localhost:3001";

  get console => null;
  Future<List<dynamic>?> fetchTodos() async {
    try {
      final response =
          await http.get(Uri.parse(baseUrl + "/cached"), headers: headers);
      console.log(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
