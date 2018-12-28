import 'dart:math';

import 'package:flutter/material.dart';
import 'package:visualmandarin/Keys.dart';
import 'package:visualmandarin/navigation/NavWidget.dart';

class NavViewDetail extends StatefulWidget {
  @override
  NavViewDetailState createState() => NavViewDetailState();
}

class NavViewDetailState extends State<NavViewDetail>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  Animation<double> animationFadeInOut;
  MenuAnimationStatus animationStatus;

  @override
  void initState() {
    super.initState();
    animationStatus = MenuAnimationStatus.close;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..addListener(() {});
    animation = Tween(begin: -pi / 2.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed)
          animationStatus = MenuAnimationStatus.open;
        else if (status == AnimationStatus.dismissed)
          animationStatus = MenuAnimationStatus.close;
        else
          animationStatus = MenuAnimationStatus.animation;
      });

    animationFadeInOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.5, curve: Curves.ease)));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Transform.rotate(
        angle: animation.value,
        origin: Offset(24.0, 56.0),
        alignment: Alignment.topLeft,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: screenWidth,
            height: screenHeight,
            color: Color(Keys.DARK_GREY),
            child: Stack(
              children: <Widget>[
                getTitleStyle(screenWidth, animationFadeInOut.value),
                getHamburgerIcon(playAnimation),
                loadNavData(context, playAnimation)
              ],
            ),
          ),
        ));
  }

  void playAnimation(int index) {
    if (index != -1) Keys.INDEX = index;
    print(animationStatus.toString() + " " + Keys.INDEX.toString());
    try {
      if (animationStatus == MenuAnimationStatus.animation) {
      } else if (animationStatus == MenuAnimationStatus.close)
        animationController.forward().orCancel;
      else
        animationController.reverse().orCancel;
    } on TickerCanceled {}
  }
}

enum MenuAnimationStatus { close, open, animation }
