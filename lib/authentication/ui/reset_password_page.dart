import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';

class ResetPasswordPage extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    Widget _buildEmailResetBar(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: _themeData.accentColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(38.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 4.0,
                      bottom: 4.0,
                    ),
                    child: TextField(
                      controller: emailController,
                      onChanged: (String txt) {},
                      style: const TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(38.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                  onTap: () {
                    if (emailController.text.isEmpty ||
                        !emailController.text.contains('@')) {
                      Get.snackbar(
                        'Unsuccessful'.tr,
                        'The email entered is invalid!',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 5),
                        backgroundColor: Colors.red,
                        colorText: Get.theme.snackBarTheme.actionTextColor,
                      );
                    } else {
                      FocusScope.of(context).requestFocus(FocusNode());

                      // _auth.sendPasswordResetEmail(email: emailController.text);

                      Get.back();

                      Get.snackbar(
                        'Sent'.tr,
                        'A password reset link has been sent to your email!',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: Duration(seconds: 5),
                        backgroundColor: _themeData.primaryColor,
                        colorText: Get.theme.snackBarTheme.actionTextColor,
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      FontAwesomeIcons.arrowRight,
                      size: 20,
                      color: _themeData.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kPrimaryColour,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryColour,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Reset Password',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          const SizedBox(height: 20.0),
          _buildEmailResetBar(context),
        ],
      ),
    );
  }
}
