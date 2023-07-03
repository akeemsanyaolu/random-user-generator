import 'package:http/http.dart' as http;
import 'package:randomuser/models/user.dart';
import 'package:randomuser/models/user_dob.dart';
import 'dart:convert';

import 'package:randomuser/models/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final date = e['dob']['date'];
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      final dob = UserDob(date: DateTime.parse(date), age: e['dob']['age']);
      return User(
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat'],
          name: name,
          dob: dob);
    }).toList();
    return users;
  }
}
