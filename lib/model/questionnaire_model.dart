import 'question_model.dart';

class Questionnaire {
  int _questionNumber = 0;
  List _questionBank = [
    Question(
        questionTitle: 'Credit Accounts',
        questionDescription: 'Do you have more than 3 Credit Accounts?',
        correctAnswer: false,
        questionAnswer:
            'Keep your Credit Accounts low so as to not over-extend'),
    Question(
        questionTitle: 'Late Payments',
        questionDescription: 'Do you pay off your debts early?',
        correctAnswer: true,
        questionAnswer:
            'Late Payments will worsen your credit score. Make sure to pay on time'),
    Question(
        questionTitle: 'Credit History',
        questionDescription:
            'Do you have at least 6 months worth of credit history?',
        correctAnswer: true,
        questionAnswer:
            'A borrower with longer Credit History wil be deemed more reliable'),
    Question(
        questionTitle: 'Enquiries',
        questionDescription: 'Do you apply for loans at least once a year?',
        correctAnswer: false,
        questionAnswer:
            'Having too many enquiries can worsen Credit Score. Limit your applications'),
    Question(
        questionTitle: 'Short Term vs Long Term',
        questionDescription:
            'Do you prefer Short Term loans over Long Term loans?',
        correctAnswer: false,
        questionAnswer:
            'Short-term loans are seen less favourable as Long-term loans'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  String getQuestionTitle() {
    return _questionBank[_questionNumber].questionTitle;
  }

  String getQuestionDescription() {
    return _questionBank[_questionNumber].questionDescription;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].correctAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
