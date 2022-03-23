import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/quiz/component/controller/quiz_controller.dart';

class Option extends StatelessWidget {
  const Option({
    required this.option,
    required this.index,
    required this.press,
    Key? key,
  }) : super(key: key);

  final String option;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return Colors.green;
              } else if (index == qnController.selectedAns &&
                  index != qnController.correctAns) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: qnController.isAnswered ? null : press,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  border: Border.all(color: getTheRightColor() ),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    option,
                    style: TextStyle(color: getTheRightColor() , fontSize: 16),
                  ),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == Colors.grey ? Colors.transparent : getTheRightColor(),
                      border: Border.all(color: getTheRightColor() ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: getTheRightColor() == Colors.grey ? null : Icon(getTheRightIcon(), size: 16)
                  ),
                ],
              ),
            ),
          );
        });
  }
}
