import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/ui/card_widget.dart';

class LoanWidget extends StatelessWidget {
  final String bankName;
  final String interestRate;
  final String processingFee;
  LoanWidget(
      {required this.bankName,
      required this.interestRate,
      required this.processingFee});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: CardWidget(
        padding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 0,
        ),
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              bankName,
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            Text(
              interestRate,
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            Text(
              processingFee,
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ],
        ),
        top: 10,
        bottom: 10,
        left: 10,
        right: 10,
        color: Colors.white,
      ),
    );
  }
}
