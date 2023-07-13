import 'package:flutter/material.dart';
import 'package:randomuser/screen/enter_amount.dart';
import 'package:randomuser/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EnterAmount(),
    );
  }
}
