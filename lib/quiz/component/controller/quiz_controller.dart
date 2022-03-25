import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz/model/Question.dart';
import 'package:quiz/quiz/QuizScreen.dart';

// We use get package for our state management

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Lets animated our progress bar
  late AnimationController _animationController;
  late Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map((e) => Question(
          id: e['id'],
          question: e['question'],
          answer: e['answer_index'],
          mutiple: e['mutiple'],
          options: e['options']))
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  bool _isCorrect = false;
  bool get isCorrect => this._isCorrect;

  late List<int> _correctAns = [];
  List<int> get correctAns => this._correctAns;

  late List<int> _selectedAns = [];
  List<int> get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    _animationController.forward();

    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  void checkSelectedAns(int selectedIndex, bool mutiple) {
    if (mutiple) {
      if (!_selectedAns.contains(selectedIndex)) {
        _selectedAns.add(selectedIndex);
      } else {
        _selectedAns.remove(selectedIndex);
      }
    } else {
      _selectedAns.clear();
      _selectedAns.add(selectedIndex);
    }

    update();
  }

  void checkAns(Question question) {
    if (question.mutiple) {
      _isAnswered = true;
      _correctAns = question.answer;
      _selectedAns = selectedAns;

      _isCorrect = true;

      for (int i = 0; i < _selectedAns.length; i++) {
        if (!_correctAns.contains(_selectedAns.length)) {
          _isCorrect = false;
          break;
        }
      }

      if (_correctAns.length != _selectedAns.length) _isCorrect = false;

      if (isCorrect) {
        _numOfCorrectAns++;

        Future.delayed(Duration(seconds: 3), () {
          nextQuestion();
        });
      }

      update();
    } else {
      _isAnswered = true;
      _correctAns = question.answer;
      _selectedAns = selectedAns;
      _isCorrect = false;

      if (_correctAns[0] == _selectedAns[0]) {
        _isCorrect = true;
        _numOfCorrectAns++;

        Future.delayed(Duration(seconds: 3), () {
          nextQuestion();
        });
      }

      update();
    }
  }

  void nextQuestion() {
    _selectedAns.clear();

    if (_questionNumber.value != _questions.length) {
      _isCorrect = false;
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward();
    } else {}
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
