import 'package:flutter/material.dart';
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
                child: Row(
                  children: [
                    Expanded(
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
                        bottom: 10.0,
                        left: 20.0,
                        right: 10.0,
                        color: Colors.yellow.shade400,
                      ),
                    ),
                    Expanded(
                      child: CardWidget(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Upcoming loans',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                        top: 10.0,
                        bottom: 10.0,
                        left: 10.0,
                        right: 20.0,
                        color: Colors.red.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: CardWidget(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Loan Paid',
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  Text(
                                    '\$100.00',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Loan Remaining',
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  Text(
                                    '\$900.00',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          top: 10.0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey.shade300,
                            valueColor: AlwaysStoppedAnimation(
                              Colors.green.shade400,
                            ),
                            minHeight: 35.0,
                            value: 0.1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                          top: 15.0,
                        ),
                        child: Text(
                          'Next installment on Nov 30, 2021: \$50.00',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  top: 20,
                  bottom: 20,
                  left: 20,
                  right: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
