import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/quiz/component/controller/quiz_controller.dart';

class Option extends StatelessWidget {
  const Option({
    required this.option,
    required this.index,
    required this.press,
    required this.mutiple,
    Key? key,
  }) : super(key: key);

  final String option;
  final int index;
  final VoidCallback press;
  final bool mutiple;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (qnController.correctAns.contains(index)) {
                return Colors.green;
              } else if (qnController.selectedAns.contains(index) &&
                  !qnController.correctAns.contains(index)) {
                return Colors.red;
              }
            } else {
              if (qnController.selectedAns.contains(index)) {
                return Colors.blue;
              }
            }

            return Colors.grey;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  border: Border.all(color: getTheRightColor()),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      option,
                      style: TextStyle(color: getTheRightColor(), fontSize: 16),
                    ),
                  ),
                  Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: getTheRightColor() == Colors.grey
                              ? Colors.transparent
                              : getTheRightColor(),
                          border: Border.all(color: getTheRightColor()),
                          borderRadius: mutiple ? BorderRadius.circular(0) : BorderRadius.circular(50)),
                      child: getTheRightColor() == Colors.grey
                          ? null
                          : Icon(getTheRightIcon(), size: 16)),
                ],
              ),
            ),
          );
        });
  }
}
