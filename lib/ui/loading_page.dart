import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/widgets/progress_indicators.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: circularProgressIndicator(context: context),
          ),
        ],
      ),
    );
  }
}
