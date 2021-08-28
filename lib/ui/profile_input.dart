import 'package:flutter/material.dart';

class ProfileInputWidget extends StatefulWidget {
  final String value;
  final String hint;
  final int lines;
  ProfileInputWidget(
      {required this.value, required this.hint, required this.lines});

  @override
  _ProfileInputWidgetState createState() => _ProfileInputWidgetState();
}

class _ProfileInputWidgetState extends State<ProfileInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15.0,
        left: 10.0,
        right: 10.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hint,
          fillColor: Colors.white,
          filled: true,
        ),
        initialValue: widget.value,
        maxLines: widget.lines,
      ),
    );
  }
}
