import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget widget;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final Color color;

  CardWidget({
    required this.widget,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: widget,
    );
  }
}
