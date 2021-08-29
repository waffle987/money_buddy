import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/ui/loan_page.dart';
import 'package:money_buddy_mobile/ui/quiz_page.dart';
import 'card_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
    );
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
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: [
          Container(
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoanPage();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Take a loan',
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
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
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Text(
                    'Financial Tips and Tricks',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    widget: ListView(
                      children: [
                        ExpansionTile(
                          textColor: Colors.red,
                          iconColor: Colors.red,
                          title: Text('Learn Self-Control'),
                          children: [
                            ListTile(
                              title: Text(
                                'If you’re lucky, your parents taught you this skill when you were a kid. If not, keep in mind that the sooner you learn the fine art of delaying gratification, the sooner you’ll find it easy to keep your personal finances in order. Although you can effortlessly buy an item on credit the minute you want it, it’s better to wait until you’ve actually saved up the money for the purchase. Do you really want to pay interest on a pair of jeans or a box of cereal? A debit card is as handy and takes the money from your checking account, rather than racking up interest charges.',
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          textColor: Colors.red,
                          iconColor: Colors.red,
                          title: Text('Control Your Financial Future'),
                          children: [
                            ListTile(
                              title: Text(
                                'If you don’t learn to manage your money, then other people will find ways to mismanage it for you. Some of these people may be ill-intentioned, like unscrupulous, commission-based financial planners. Others may be well-meaning but may not know what they’re doing, like Grandma Betty, who really wants you to own your own house even though you can only afford one by taking on a risky adjustable-rate mortgage.',
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          textColor: Colors.red,
                          iconColor: Colors.red,
                          title: Text('Know Where Your Money Goes'),
                          children: [
                            ListTile(
                              title: Text(
                                'Once you’ve gone through a few personal finance books, you’ll realize how important it is to make sure that your expenses aren’t exceeding your income. The best way to do this is by budgeting. Once you see how the cost of your morning coffee adds up over the course of a month, you’ll realize that making small, manageable changes in your everyday expenses can have as big an impact on your financial situation as getting a raise.',
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          textColor: Colors.red,
                          iconColor: Colors.red,
                          title: Text('Start An Emergency Fund'),
                          children: [
                            ListTile(
                              title: Text(
                                'Having money in savings to use for emergencies can keep you out of trouble financially and help you sleep better at night. Also, if you get into the habit of saving money and treating it as a nonnegotiable monthly expense, then pretty soon, you’ll have more than just emergency money saved up—you’ll have retirement money, vacation money, or even money for a down payment on a home.',
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          textColor: Colors.red,
                          iconColor: Colors.red,
                          title: Text('Start Saving For Retirement'),
                          children: [
                            ListTile(
                              title: Text(
                                'Just as your parents probably sent you off to kindergarten with high hopes of preparing you for success in a world that seemed eons away, you need to plan for your retirement well in advance. Because of the way compound interest works, the sooner you start saving, the less principal you’ll have to invest to end up with the amount that you need to retire.',
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          textColor: Colors.red,
                          iconColor: Colors.red,
                          title: Text('Get A Grip On Taxes'),
                          children: [
                            ListTile(
                              title: Text(
                                'Finally, take the time to learn to do your own taxes. Unless you have a complicated financial situation, it’s not that hard to do, and you won’t have the expense of paying a tax professional for the work. Tax software makes the job much easier than it was when your parents were starting out and ensures that you can file online.',
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          textColor: Colors.red,
                          iconColor: Colors.red,
                          title: Text('Guard Your Health'),
                          children: [
                            ListTile(
                              title: Text(
                                'If meeting monthly health insurance premiums seems impossible, what will you do if you have to go to the emergency room—where a single visit for a minor injury like a broken bone can cost thousands of dollars? If you’re uninsured, don’t wait another day to apply for health insurance. It’s easier than you think to wind up in a car accident or trip and fall down a flight of stairs.',
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          textColor: Colors.red,
                          iconColor: Colors.red,
                          title: Text('Protect Your Wealth'),
                          children: [
                            ListTile(
                              title: Text(
                                'You’ll also want to protect your money from taxes—which is easy to do with a retirement account—and from inflation, which you can do by making sure that all of your money is earning interest. There are a variety of vehicles in which you can invest your savings, such as high-interest savings accounts, money market funds, CDs, stocks, bonds, and mutual funds. The first three are relatively free of risk, while the remaining three carry greater possibilities for financial setbacks but also greater possibilities for monetary rewards. Learning about investing is an important skill for building up your savings—and, eventually, building wealth.',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
