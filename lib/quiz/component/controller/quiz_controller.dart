import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz/model/Question.dart';

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
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(
            begin: 0,
            end: 1.0)
        .animate(_animationController)
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
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkSelectedAns(int selectedIndex, bool mutiple) {

    print(_selectedAns);

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
  }

  void checkAns(Question question) {
    if (question.mutiple) {
      _isAnswered = true;
      _correctAns = question.answer;
      _selectedAns = selectedAns;

      bool correct = true;
      if (_correctAns[0] == _selectedAns[0]) _numOfCorrectAns++;

      for (int i = 0; i < _selectedAns.length; i++) {
        if (!_correctAns.contains(_selectedAns.length)) {
          correct = false;
          break;
        }
      }

      if (_correctAns.length != _selectedAns.length) correct = false;

      print(selectedAns);

      if (correct) _numOfCorrectAns++;

      _animationController.stop();
      update();
    } else {
      _isAnswered = true;
      _correctAns = question.answer;
      _selectedAns = selectedAns;

      if (_correctAns[0] == _selectedAns[0]) _numOfCorrectAns++;

      _animationController.stop();
      update();
    }
  }

  void nextQuestion() {
    _selectedAns.clear();

    if (_questionNumber.value != _questions.length) {
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
