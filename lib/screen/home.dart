import 'package:flutter/material.dart';

import 'package:randomuser/models/user.dart';
import 'package:randomuser/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
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
            final phone = user.phone;
            final dob = user.dob;
            // final location = user.location;
            final color = user.gender == 'male' ? Colors.blue : Colors.green;
            return ListTile(
              title: Text(name),
              subtitle: Text(user.location.state),
              //tileColor: color,
            );
          }),
    );
  }

  Future<void> fetchUser() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
