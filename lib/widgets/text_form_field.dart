import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';

class CustomTextFormField extends StatelessWidget {
  final String header;
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final iconWithSizedBox;

  const CustomTextFormField({
    required this.header,
    required this.hintText,
    required this.textEditingController,
    required this.textInputType,
    this.iconWithSizedBox,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            iconWithSizedBox == null ? Container() : iconWithSizedBox,
            Text(
              header,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        Container(
          child: TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            maxLines: null,
            decoration: kTextFieldInputDecoration.copyWith(
              hintText: hintText == '' ? 'Type here...' : hintText,
            ),
          ),
        ),
      ],
    );
  }
}
