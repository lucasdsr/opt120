import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'config.dart';

export 'users.dart';

class UserRequests {

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final url = Uri.parse('$baseUrl/users');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseBody = jsonDecode(response.body);
      final List<Map<String, dynamic>> users =
          responseBody.map((user) => user as Map<String, dynamic>).toList();
      return users;
    }

    throw('Error ${response.statusCode}');
  }

  dynamic createUser( String name, String email, String password) async {
    dynamic url = Uri.parse('$baseUrl/user');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      
      body: jsonEncode(<String, String>{
        'nome': name,
        'email': email,
        'senha': password,
      }),
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  Future<void> deleteUser(String? id) async {
    final url = Uri.parse('$baseUrl/users/$id');
    final response = await http.delete(url);
    if (response.statusCode != 200) {
      throw Exception('Error ${response.statusCode}');
    }
  }
}