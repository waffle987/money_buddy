import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/model/questionnaire_model.dart';
import 'package:money_buddy_mobile/ui/quiz_page.dart';
import 'card_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 85.0,
        centerTitle: false,
        title: Transform(
          transform: Matrix4.translationValues(10.0, 0.0, 0.0),
          child: Text(
            'Hello User',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.0),
            topRight: Radius.circular(60.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: CardWidget(
                  top: 20.0,
                  bottom: 20.0,
                  left: 20.0,
                  right: 20.0,
                  color: Colors.white,
                  widget: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Text(
                            'Total Points:',
                            style: TextStyle(fontSize: 29.0),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '1000',
                          style: TextStyle(fontSize: 40.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Expanded(
                  child: CardWidget(
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Take a loan',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                    top: 10.0,
                    bottom: 20.0,
                    left: 20.0,
                    right: 20.0,
                    color: Colors.yellow.shade400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Scrollbar(
                  child: CardWidget(
                    widget: QuizPage(),
                    top: 20,
                    bottom: 20,
                    left: 20,
                    right: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
