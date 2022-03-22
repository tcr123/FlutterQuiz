import 'package:flutter/material.dart';
import 'package:quiz/quiz/component/progress_bar.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ProgressBar(),
            )
          ],
        ),
      )
    ]);
  }
}

