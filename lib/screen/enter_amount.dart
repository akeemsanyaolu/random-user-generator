import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:randomuser/screen/home.dart';

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
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              amount: int.parse(_textEditingController.text),
                            )));
              },
              child: Text('Submit'))
        ],
      ),
    );
  }
}
