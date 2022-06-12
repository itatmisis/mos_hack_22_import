import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

enum BeautuifulPadding {
  all,
  vertical,
  horizontal,
  none
}

class ElevatedContainerDecoration {
  double borderRadius = 20;
  ///TODO replace with theme
  Color backgroundColor = const Color(0xFFFFFFFF);
  Color shadowColor = const Color(0x33000000);

  double elevation = 10;
  BeautuifulPadding beautifulPadding = BeautuifulPadding.none;

  ElevatedContainerDecoration({
    double? borderRadius,
    Color? backgroundColor,
    Color? shadowColor,
    double? elevation,
    BeautuifulPadding? beautifulPadding,
  }) {
    if (borderRadius != null) this.borderRadius = borderRadius;
    if (backgroundColor != null) this.backgroundColor = backgroundColor;
    if (shadowColor != null) this.shadowColor = shadowColor;
    if (elevation != null) this.elevation = elevation;
    if (beautifulPadding != null) this.beautifulPadding = beautifulPadding;
  }
}

class PushableElevatedContainerDecoration extends ElevatedContainerDecoration {
  Duration duration = const Duration(milliseconds: 60);
  Curve animationCurve = Curves.fastOutSlowIn;
  double touchedElevation = 3;

  PushableElevatedContainerDecoration({
    Duration? duration,
    Curve? animationCurve,
    double? borderRadius,
    Color? backgroundColor,
    Color? shadowColor,
    double? elevation,
    BeautuifulPadding? beautifulPadding,
    double? touchedElevation,
  }): super(borderRadius: borderRadius, backgroundColor: backgroundColor, shadowColor: shadowColor, elevation: elevation, beautifulPadding: beautifulPadding){
    if (duration != null) this.duration = duration;
    if (animationCurve != null) this.animationCurve = animationCurve;
    if (touchedElevation != null) this.touchedElevation = touchedElevation;
  }
}