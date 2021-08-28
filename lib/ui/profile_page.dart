import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_buddy_mobile/authentication/controllers/auth_controller.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';
import 'package:money_buddy_mobile/ui/user_edit_profile_page.dart';
import 'package:money_buddy_mobile/widgets/circle_button.dart';
import 'package:money_buddy_mobile/widgets/document_feed.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    /// GetX Controllers
    final AuthController _authController = AuthController.to;

    /// Build the profile header
    Widget _buildProfileHeader() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: _mediaQuery.size.height * 0.25,
              padding: const EdgeInsets.only(
                  top: 66.0 + 16.0, bottom: 16.0, left: 16.0, right: 16.0),
              margin: const EdgeInsets.only(top: 66.0, left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                color: _themeData.accentColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Obx(
                () => ListView(
                  children: [
                    Text(
                      _authController.firestoreUser.value!.username,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Obx(
                  () => CircleAvatar(
                    backgroundColor: kPrimaryColour,
                    child: _authController.firestoreUser.value!.photoUrl == ''
                        ? Icon(
                            FontAwesomeIcons.solidUser,
                            size: 60.0,
                            color: _themeData.accentColor,
                          )
                        : Container(),
                    radius: 66.0,
                    backgroundImage:
                        _authController.firestoreUser.value!.photoUrl == ''
                            ? null
                            : CachedNetworkImageProvider(
                                _authController.firestoreUser.value!.photoUrl),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeData.scaffoldBackgroundColor,
        elevation: 0.0,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          CircleButton(
            icon: FontAwesomeIcons.solidEdit,
            function: () => Get.to(() => UserEditProfilePage()),
            buttonColour: kPrimaryColour,
            iconColour: _themeData.accentColor,
          ),
          SizedBox(width: _mediaQuery.size.width * 0.03),
          CircleButton(
            icon: FontAwesomeIcons.signOutAlt,
            function: () => _authController.signOut(),
            buttonColour: Colors.red,
            iconColour: _themeData.accentColor,
          ),
          SizedBox(width: _mediaQuery.size.width * 0.03),
        ],
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 25.0,
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            DocumentFeed(),
          ],
        ),
      ),
    );
  }
}
