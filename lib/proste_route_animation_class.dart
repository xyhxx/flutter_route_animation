import 'package:flutter/material.dart';
import 'proste_route_animation_type.dart';

class FadeRouteAnimation extends PageRouteBuilder {
  Widget route;
  Duration duration;
  Duration reverseDuration;
  Curve curve;
  FadeRouteAnimation(
    this.route, {
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
  }) : super(
          pageBuilder: (context, animate, _) => route,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          transitionsBuilder: (context, animation, anim, child) {
            Animation animated = Tween<double>(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: curve))
                .animate(animation);
            return FadeTransition(opacity: animated, child: child);
          },
        );
}

class SlideRouteAnimation extends PageRouteBuilder {
  Widget route;
  Duration duration;
  Duration reverseDuration;
  SlideMode mode;
  bool useFade;
  Curve curve;

  SlideRouteAnimation(
    this.route, {
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    this.mode = SlideMode.fromRight,
    this.useFade = false,
    this.curve = Curves.linear,
  }) : super(
          pageBuilder: (context, _, __) => route,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          transitionsBuilder: (contex, animation, _, child) {
            Animation<Offset> position;
            switch (mode) {
              case SlideMode.fromRight:
                position = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                    .chain(CurveTween(curve: curve))
                    .animate(animation);
                break;
              case SlideMode.fromLeft:
                position =
                    Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                        .chain(CurveTween(curve: curve))
                        .animate(animation);
                break;
              case SlideMode.fromBottom:
                position = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
                    .chain(CurveTween(curve: curve))
                    .animate(animation);
                break;
              case SlideMode.fromTop:
                position =
                    Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
                        .chain(CurveTween(curve: curve))
                        .animate(animation);
                break;
            }
            Widget transitionWidget = SlideTransition(
              position: position,
              child: child,
            );
            if (useFade) {
              return FadeTransition(
                opacity: animation,
                child: transitionWidget,
              );
            }
            return transitionWidget;
          },
        );
}

class ScaleRouteAnimation extends PageRouteBuilder {
  Widget route;
  Duration duration;
  Duration reverseDuration;
  bool useFade;
  Alignment alignment;
  Curve curve;

  ScaleRouteAnimation(
    this.route, {
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    this.useFade = false,
    this.alignment = Alignment.center,
    this.curve = Curves.linear,
  }) : super(
          pageBuilder: (context, _, __) => route,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          transitionsBuilder: (context, animation, _, child) {
            Animation animated = Tween<double>(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: curve))
                .animate(animation);
            Widget transitionWidget = ScaleTransition(
              scale: animated,
              alignment: alignment,
              child: child,
            );
            if (useFade) {
              return FadeTransition(
                opacity: animated,
                child: transitionWidget,
              );
            }
            return transitionWidget;
          },
        );
}

class RotationRouteAnimation extends PageRouteBuilder {
  Widget route;
  Duration duration;
  Duration reverseDuration;
  Alignment alignment;
  bool useFade;
  Curve curve;

  RotationRouteAnimation(
    this.route, {
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    this.alignment = Alignment.bottomCenter,
    this.useFade = false,
    this.curve = Curves.linear,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => route,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          transitionsBuilder: (context, animation, _, child) {
            Animation<double> turns = Tween(begin: 1.2, end: 1.0)
                .chain(CurveTween(curve: curve))
                .animate(animation);
            Widget transitionChild = RotationTransition(
              turns: turns,
              child: child,
              alignment: alignment,
            );
            if (useFade) {
              return FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0)
                    .chain(CurveTween(curve: curve))
                    .animate(animation),
                child: transitionChild,
              );
            }
            return transitionChild;
          },
        );
}

class SizeRouteAnimation extends PageRouteBuilder {
  Widget route;
  Duration duration;
  Duration reverseDuration;
  bool useFade;
  Alignment alignment;
  Axis axis;
  Curve curve;

  SizeRouteAnimation(
    this.route, {
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    this.useFade = false,
    this.alignment = Alignment.bottomCenter,
    this.axis = Axis.vertical,
    this.curve = Curves.linear,
  }) : super(
          pageBuilder: (context, _, __) => route,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          transitionsBuilder: (context, animation, _, child) {
            Animation animated = Tween<double>(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: curve))
                .animate(animation);

            Widget transitionChild = Align(
              alignment: alignment,
              child: SizeTransition(
                sizeFactor: animated,
                child: child,
                axis: axis,
              ),
            );
            if (useFade) {
              return FadeTransition(
                opacity: animated,
                child: transitionChild,
              );
            }

            return transitionChild;
          },
        );
}
