import 'package:flutter/cupertino.dart';

class Clipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height / 2.25);
    var firstControlPoint = new Offset(size.width / 4, size.height / 2);
    var firstEndPoint = new Offset(size.width / 2, size.height / 2 - 60);
    var secondControlPoint =
        new Offset(size.width - (size.width / 4), size.height / 3 - 65);
    var secondEndPoint = new Offset(size.width, size.height / 2 - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
