import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/model/Question.dart';
import 'package:quiz/quiz/component/controller/quiz_controller.dart';
import 'package:quiz/quiz/component/option.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    required this.question,
    Key? key,
  }) : super(key: key);

  final Question question;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  List<Widget> listWidget = [
    Text(""),
    Text(
      "Hello2 222 2 2 22 222222 222 2222",
      style: TextStyle(color: Colors.black),
    )
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    List<Widget> components = [
      ElevatedButton(
        onPressed: () {
          if (!_controller.selectedAns.isEmpty) {
            _controller.checkAns(widget.question);
            print(_controller.isCorrect);
            
            setState(() {
              if (!_controller.isCorrect) {
                
                index = 1;
              }
            });
          }
        },
        child: const Text("Submit"),
        style: ElevatedButton.styleFrom(primary: Colors.green[600]),
      ),
      ElevatedButton(
        onPressed: () {
          if (_controller.isAnswered) {
            _controller.nextQuestion();
            setState(() {
              index = 0;
            });
          }
        },
        child: const Text("Next"),
        style: ElevatedButton.styleFrom(primary: Colors.green[600]),
      ),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: SingleChildScrollView(
        child: Column(children: [
          Text(widget.question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.black)),
          const SizedBox(
            height: 8,
          ),
          ...List.generate(
              widget.question.options.length,
              (index) => Option(
                    option: widget.question.options[index],
                    index: index,
                    press: () {
                      _controller.checkSelectedAns(
                          index, widget.question.mutiple);
                    },
                    mutiple: widget.question.mutiple,
                  )),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: listWidget[index]),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              components[index],
            ],
          ),
        ]),
      ),
    );
  }
}
