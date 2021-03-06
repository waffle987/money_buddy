import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';

class EmptySplashPage extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;

  EmptySplashPage({
    required this.iconData,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 100.0,
            color: kPrimaryColour,
          ),
          verticalSpaceMedium,
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          verticalSpaceLarge,
        ],
      ),
    );
  }
}
