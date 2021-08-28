import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_buddy_mobile/config/ui_helpers.dart';
import 'package:money_buddy_mobile/controllers/bottom_navigation_bar_controller.dart';
import 'package:money_buddy_mobile/ui/home.dart';
import 'package:money_buddy_mobile/ui/profile_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// GetX controllers
    final BottomNavigationBarController _bottomNavigationBarController =
        Get.put(
      BottomNavigationBarController(),
      permanent: false,
    );

    /// Bottom Navigation Bar Widget
    Widget _buildBottomNavigationBar({
      required BuildContext context,
      required BottomNavigationBarController bottomNavigationBarController,
    }) {
      return Obx(
        () => AnimatedBottomNavigationBar(
          icons: [
            FontAwesomeIcons.home,
            FontAwesomeIcons.solidUserCircle,
          ],
          backgroundColor: Colors.white,
          activeColor: kPrimaryColour,
          splashColor: kPrimaryColour,
          inactiveColor: kPrimaryColour.withOpacity(0.3),
          iconSize: 30.0,
          gapLocation: GapLocation.center,
          activeIndex: bottomNavigationBarController.tabIndex.value,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: bottomNavigationBarController.changeTabIndex,
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(
        context: context,
        bottomNavigationBarController: _bottomNavigationBarController,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColour,
        onPressed: () {},
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        reverse: _bottomNavigationBarController.reverse.value,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
          );
        },
        child: Obx(
          () => getViewForIndex(_bottomNavigationBarController.tabIndex.value),
        ),
      ),
    );
  }
}

Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return Home();
    case 1:
      return ProfilePage();
    default:
      return Scaffold();
  }
}
