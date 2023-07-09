import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EnterAmount extends StatelessWidget {
  const EnterAmount({super.key});

  @override
  Widget build(BuildContext context) {
    final _textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random User'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration:
                InputDecoration(labelText: 'Enter amount of users to generate'),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Submit'))
        ],
      ),
    );
  }
}
