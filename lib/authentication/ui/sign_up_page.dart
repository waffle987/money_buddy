import 'package:flutter/material.dart';
import 'package:money_buddy_mobile/authentication/controllers/auth_controller.dart';
import 'package:money_buddy_mobile/config/assets.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';
import 'package:money_buddy_mobile/widgets/busy_button.dart';
import 'package:money_buddy_mobile/widgets/input_field.dart';
import 'package:money_buddy_mobile/widgets/text_link.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = AuthController.to;

    Widget termsAndConditionsSection() {
      return Column(
        children: [
          verticalSpaceLarge,
          Text(
            "By joining Money Buddy, you agree to",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          verticalSpaceSmall,
          TextLink(
            text: "Money Buddy's General Terms of Use",
            onPressed: () {},
            color: Colors.white,
          ),
          verticalSpaceSmall,
          Text(
            'and',
            style: TextStyle(color: Colors.white),
          ),
          verticalSpaceSmall,
          TextLink(
            text: "Money Buddy's Privacy Policy",
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kPrimaryColour,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryColour,
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.8),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Hero(
                    tag: 'logo',
                    transitionOnUserGestures: true,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Assets.logo),
                      radius: 40.0,
                      backgroundColor: kPrimaryColour,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
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
                title: 'Sign Up',
                onTap: () {
                  _authController.registerWithEmailAndPassword(context);
                },
                color: kSecondaryColor,
              ),
              termsAndConditionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
