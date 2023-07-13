import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:randomuser/models/user.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.amount});
  final int amount;

  @override
  State<HomeScreen> createState() => _HomeScreenState(amount: amount);
}

class _HomeScreenState extends State<HomeScreen> {
  final int amount;
  List<User> users = [];

  _HomeScreenState({required this.amount});

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<List<User>> fetchUsers() async {
    final url = 'https://randomuser.me/api/?results=$amount';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random User Generator'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final name = user.fullName;
            final email = user.email;
            //final phone = user.phone;
            //final dob = user.dob;
            // final location = user.location;
            //final color = user.gender == 'male' ? Colors.blue : Colors.green;
            return ListTile(
              title: Text(name),
              subtitle: Text(email),
              //tileColor: color,
            );
          }),
    );
  }

  Future<void> fetchUser() async {
    final response = await fetchUsers();
    setState(() {
      users = response;
    });
  }
}
