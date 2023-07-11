import 'dart:convert';

import 'package:suitmedia_km_test/data/users_data.dart';
import 'package:http/http.dart' as http;

class ReqresAPI {
  static const String baseURL = 'https://reqres.in/api/';

  Future<Users> list(http.Client client, int page) async {
    final response =
        await client.get(Uri.parse('$baseURL' 'users?page=$page&per_page=10'));
    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user list');
    }
  }
}
