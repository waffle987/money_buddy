import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/authentication/controllers/auth_controller.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';
import 'package:money_buddy_mobile/ui/card_widget.dart';
import 'package:money_buddy_mobile/ui/loan_page.dart';
import 'package:money_buddy_mobile/ui/quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    final AuthController _authController = AuthController.to;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: _themeData.scaffoldBackgroundColor,
              elevation: 0.0,
              toolbarHeight: 85.0,
              centerTitle: false,
              title: Transform(
                transform: Matrix4.translationValues(10.0, 0.0, 0.0),
                child: Text(
                  'Hello ${_authController.firestoreUser.value!.username}',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.0),
                  topRight: Radius.circular(60.0),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: _mediaQuery.size.height * 0.05),
                  CardWidget(
                    padding: EdgeInsets.symmetric(
                      horizontal: _mediaQuery.size.width * 0.25,
                      vertical: _mediaQuery.size.height * 0.03,
                    ),
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${(int.parse(_authController.firestoreUser.value!.points) % 100).toString()} points',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: _mediaQuery.size.height * 0.01),
                        Text(
                          'Lvl ${(int.parse(_authController.firestoreUser.value!.points) ~/ 100).toString()}',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    top: 10.0,
                    bottom: 20.0,
                    left: 20.0,
                    right: 20.0,
                    color: Colors.teal,
                  ),
                  CardWidget(
                    padding: EdgeInsets.symmetric(
                      horizontal: _mediaQuery.size.width * 0.25,
                      vertical: _mediaQuery.size.height * 0.03,
                    ),
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
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    top: 10.0,
                    bottom: 20.0,
                    left: 20.0,
                    right: 20.0,
                    color: Colors.teal,
                  ),
                  Container(
                    height: _mediaQuery.size.height * 0.5,
                    child: CardWidget(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      widget: QuizPage(),
                      top: 20,
                      bottom: 20,
                      left: 20,
                      right: 20,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Text(
                      'Financial Tips and Tricks',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CardWidget(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    widget: Column(
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
