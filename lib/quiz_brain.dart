import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';

class QuizBrain {
  List<Icon> _score = [];
  int _quesNo = 0;
  int _rightAns = 0;

  List<Question> _questionBank = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  Question getQuestion() {
    return _questionBank[_quesNo];
  }

  int getQuesNo() {
    return _quesNo;
  }

  void nextQuestion(bool b) {
    if (_quesNo < _questionBank.length - 1) {
      if (_questionBank[_quesNo].questionAnswer == b) {
        _score.add(
          Icon(Icons.check, color: Colors.green),
        );
        _rightAns++;
      } else {
        _score.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
      _quesNo++;
    } //else {
    // _quesNo = 0;
    // _score = [];
    //}
    print(_quesNo);
    print(_questionBank.length);
  }

  int getRightAns() {
    return _rightAns;
  }

  List<Icon> getScore() {
    return _score;
  }
}
