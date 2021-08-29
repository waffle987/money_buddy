import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/ui/loan_widget.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  _LoanPageState createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loans',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoanWidget(
              bankName: 'Goldman Sachs',
              interestRate: '3.75%',
              processingFee: '\$0'),
          LoanWidget(
              bankName: 'DBS Bank',
              interestRate: '4.00%',
              processingFee: '\$0'),
          LoanWidget(
              bankName: 'UOB Bank', interestRate: '4.02', processingFee: '\$0'),
          LoanWidget(
              bankName: 'OCBC Bank',
              interestRate: '4.04',
              processingFee: '\$0'),
        ],
      ),
    );
  }
}
