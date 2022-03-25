import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/quiz/component/controller/quiz_controller.dart';
import 'package:quiz/quiz/component/progress_bar.dart';
import 'package:quiz/quiz/component/question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(0, 120, 120, 1),
                Color.fromRGBO(0, 170, 170, 1),
                Color.fromRGBO(0, 220, 220, 1)
              ]),
        ),
      ),
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProgressBar(),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () =>  Text.rich(TextSpan(
                      text: "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: Colors.black),
                        )
                      ])),
                  ),
                ],
              ),
              const Divider(
                thickness: 1.5,
                color: Colors.black,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _questionController.pageController,
                    onPageChanged: _questionController.updateTheQnNum,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(question: _questionController.questions[index])
                )
              )
            ],
          ),
        ),
      )
    ]);
  }
}
