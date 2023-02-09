import 'package:quiz_app/models/question_answers_model.dart';

class QuizListUtil {
  int _index = 0;
  List<QuestionAnswersModel> suroolorJooptor = [
    QuestionAnswersModel(
      suroolor: "Кыргызстанда  7 область барбы?", // 0
      jooptor: true,
    ),
    QuestionAnswersModel(
      suroolor: 'Osh Bishkekke karaiby?', // 1
      jooptor: false,
    ),
    QuestionAnswersModel(
      suroolor: 'Batken Aigul gulunun borborubu?', // 2
      jooptor: true,
    ),
  ];
  String suroonuAlipKel() {
    if (_index < suroolorJooptor.length) {
      return suroolorJooptor[_index].suroolor;
    } else {
      return '';
    }
  }

  bool jooptuAlipKel() {
    if (_index < suroolorJooptor.length) {
      return suroolorJooptor[_index].jooptor;
    }
    return null;
  }

  void otkoz() {
    _index++;
  }

  restart() {
    _index = 0;
  }
}

final QuizListUtil quizListUtil = QuizListUtil();
