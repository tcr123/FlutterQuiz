import 'package:flutter/material.dart';
import 'package:quiz/quiz/component/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        TextButton(
            onPressed: () {
              
            },
            child: const Text(
              "Next",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ))
      ]),
      body: Body(),
    );
  }
}
