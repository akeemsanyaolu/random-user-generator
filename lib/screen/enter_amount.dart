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
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              width: 330,
              height: 42,
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Enter amount of users to generate'),
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(300, 40)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                amount: int.parse(_textEditingController.text),
                              )));
                },
                child: Text('Submit')),
            const Spacer(
              flex: 5,
            )
          ],
        ),
      ),
    );
  }
}
