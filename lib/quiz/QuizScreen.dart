import 'package:flutter/material.dart';
import 'package:quiz/quiz/component/body.dart';
import 'package:get/get.dart';
import 'package:quiz/quiz/component/controller/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
        AppBar(backgroundColor: Colors.transparent, elevation: 0,
          title: Text("Dengue")),
      body: Body(),
    );
  }
}
