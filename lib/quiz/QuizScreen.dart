import 'package:flutter/material.dart';
import 'package:quiz/quiz/component/body.dart';
import 'package:get/get.dart';
import 'package:quiz/quiz/component/controller/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        TextButton(
            onPressed: () {
              if (_controller.isAnswered) {
                _controller.nextQuestion();
              }
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
