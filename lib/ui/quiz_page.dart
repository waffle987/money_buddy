import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/model/questionnaire_model.dart';
import 'package:money_buddy_mobile/ui/card_widget.dart';

Questionnaire questionnaire = Questionnaire();

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List scoreKeeper = [];
  int _selectedIndex = 0;
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionnaire.getCorrectAnswer();
    setState(() {
      if (questionnaire.isFinished() == true) {
        _selectedIndex = 1;
        if (scoreKeeper.length == 0) {
          scoreKeeper.add('You have your finances in check! Congrats!');
        }
      } else {
        if (userPickedAnswer != correctAnswer) {
          scoreKeeper.add(questionnaire.getQuestionAnswer());
        }
      }
      questionnaire.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _selectedIndex,
      children: [
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30.0,
                ),
                child: Text(
                  questionnaire.getQuestionTitle(),
                  style: TextStyle(
                    fontSize: 27.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  questionnaire.getQuestionDescription(),
                  style: TextStyle(
                    fontSize: 27.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 5.0,
                        ),
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        checkAnswer(false);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 5.0,
                        ),
                        child: Text(
                          'No',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Expanded(
              child: ListView(
                children: scoreKeeper
                    .map(
                      (data) => CardWidget(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        widget: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            data,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        top: 10,
                        bottom: 10,
                        left: 10,
                        right: 10,
                        color: Colors.white,
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 10.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                    questionnaire.reset();
                  });
                },
                child: Text(
                  'Reset Quiz',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
