import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:money_buddy_mobile/authentication/controllers/auth_controller.dart';
import 'package:money_buddy_mobile/authentication/ui/reset_password_page.dart';
import 'package:money_buddy_mobile/authentication/ui/sign_up_page.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';
import 'package:money_buddy_mobile/widgets/busy_button.dart';
import 'package:money_buddy_mobile/widgets/input_field.dart';
import 'package:money_buddy_mobile/widgets/text_link.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    final AuthController _authController = AuthController.to;

    return Scaffold(
      backgroundColor: kPrimaryColour,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: _mediaQuery.size.height * 0.08),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: CircleAvatar(
                  child: Text("\$"),
                  radius: 120.0,
                  backgroundColor: kPrimaryColour,
                ),
              ),
              verticalSpaceTiny,
              Text(
                'Welcome to Money Buddy',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              verticalSpaceSmall,
              Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              verticalSpaceLarge,
              InputField(
                placeholder: 'Email',
                controller: _authController.emailTextController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Password',
                password: true,
                controller: _authController.passwordTextController,
              ),
              verticalSpaceMedium,
              BusyButton(
                title: 'Sign in',
                busy: false,
                onTap: () =>
                    _authController.signInWithEmailAndPassword(context),
                color: kPrimaryColour,
              ),
              verticalSpaceMedium,
              TextLink(
                text: 'Create an Account',
                onPressed: () => Get.to(() => SignUpPage()),
                color: kPrimaryColour,
              ),
              verticalSpaceSmall,
              Text(
                'or',
                style: TextStyle(color: Colors.white),
              ),
              verticalSpaceSmall,
              TextLink(
                text: 'Forgot password?',
                onPressed: () => Get.to(() => ResetPasswordPage()),
                color: kPrimaryColour,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
