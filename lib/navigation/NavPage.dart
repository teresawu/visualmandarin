import 'dart:math';

import 'package:flutter/material.dart';
import 'package:visualmandarin/navigation/NavWidget.dart';

class NavPage extends StatefulWidget {
  @override
  NavPageState createState() => NavPageState();
}

class NavPageState extends State<NavPage> with SingleTickerProviderStateMixin {
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
    return new Transform.rotate(
      angle: animation.value,
      origin: Offset(24.0, 56.0),
      alignment: Alignment.topLeft,
      child: getMaterial(context, animationFadeInOut.value),
    );
  }

  void playAnimation() {
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


final List<Map> _menus = <Map>[
  {
    "icon": Icons.streetview,
    "title": "Animal"
  },
  {
    "icon": Icons.card_travel,
    "title": "Career"
  },
  {
    "icon": Icons.color_lens,
    "title": "Color"
  },
  {
    "icon": Icons.outlined_flag,
    "title": "Country"
  },
  {
    "icon": Icons.local_drink,
    "title": "Drink"
  },
  {
    "icon": Icons.group_work,
    "title": "Fruit"
  },
  {
    "icon": Icons.kitchen,
    "title": "Kitchen"
  },
  {
    "icon": Icons.people_outline,
    "title": "People"
  },
  {
    "icon": Icons.directions_run,
    "title": "Sport"
  },
  {
    "icon": Icons.directions_boat,
    "title": "Transport"
  },
  {
    "icon": Icons.nature,
    "title": "Vegetable"
  }
];