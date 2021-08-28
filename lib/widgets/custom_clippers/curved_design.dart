import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';
import 'package:money_buddy_mobile/widgets/custom_clippers/curved_bottom_clipper.dart';

class CurvedDesign extends StatelessWidget {
  const CurvedDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return ClipPath(
      clipper: CurvedBottomClipper(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            kSecondaryColor,
            kPrimaryColour,
          ],
        )),
        height: _mediaQuery.size.height * 0.15,
      ),
    );
  }
}
