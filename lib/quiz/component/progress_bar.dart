import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz/quiz/component/controller/quiz_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(60)),
      width: double.infinity,
      height: 30,
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            print(controller.animation.value);
            print(controller.questionNumber.value);
            return Stack(
              children: [
                LayoutBuilder(
                    builder: (context, constraints) => Container(
                          width: constraints.maxWidth *
                              controller.animation.value /
                              controller.questions.length * controller.questionNumber.value,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 0, 182, 61),
                                Color.fromARGB(255, 0, 200, 77),
                                Color.fromARGB(255, 83, 207, 0),
                              ]),
                              borderRadius: BorderRadius.circular(60)),
                        )),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${(controller.animation.value * 100  * controller.questionNumber.value / controller.questions.length).round()} %"),
                        Icon(Icons.flag)
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
