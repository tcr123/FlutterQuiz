import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/model/Question.dart';
import 'package:quiz/quiz/component/controller/quiz_controller.dart';
import 'package:quiz/quiz/component/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required this.question,
    Key? key,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(question.question,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black)),
            SizedBox(
              height: 8,
            ),
            ...List.generate(question.options.length, (index) => Option(
              option: question.options[index], index: index, press: () => _controller.checkAns(question, index),
              ))
          ],
        ),
      ),
    );
  }
}
