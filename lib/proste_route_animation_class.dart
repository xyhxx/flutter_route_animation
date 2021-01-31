import 'package:flutter/material.dart';
import 'proste_route_animation_type.dart';

class ProsteFadeRoute extends PageRouteBuilder {
  Widget route;
  Duration duration;
  Duration reverseDuration;
  ProsteFadeRoute(
    this.route, {
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (context, animate, _) => route,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          transitionsBuilder: (context, animation, anim, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}

class ProsteSlideRoute extends PageRouteBuilder {
  Widget route;
  Duration duration;
  Duration reverseDuration;
  SlideMode mode;
  bool useFade;

  ProsteSlideRoute(
    this.route, {
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    this.mode = SlideMode.fromRight,
    this.useFade = false,
  }) : super(
          pageBuilder: (context, _, __) => route,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          transitionsBuilder: (contex, animation, _, child) {
            Animation<Offset> position;
            switch (mode) {
              case SlideMode.fromRight:
                position = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation);
                break;
              case SlideMode.fromLeft:
                position = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(animation);
                break;
              case SlideMode.fromBottom:
                position = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation);
                break;
              case SlideMode.fromTop:
                position = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(animation);
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

class ProsteScaleRoute extends PageRouteBuilder {
  Widget route;
  Duration duration;
  Duration reverseDuration;
  bool useFade;
  Alignment alignment;

  ProsteScaleRoute(
    this.route, {
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    this.useFade = false,
    this.alignment = Alignment.center,
  }) : super(
          pageBuilder: (context, _, __) => route,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          transitionsBuilder: (context, animation, _, child) {
            Widget transitionWidget = ScaleTransition(
              scale: animation,
              alignment: alignment,
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

class ProsteRotationRoute extends PageRouteBuilder {
  Widget route;
  Duration duration;
  Duration reverseDuration;
  Alignment alignment;
  bool useFade;

  ProsteRotationRoute(
    this.route, {
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    this.alignment = Alignment.bottomCenter,
    this.useFade = false,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => route,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          transitionsBuilder: (context, animation, _, child) {
            Animation<double> turns = Tween(begin: 1.2, end: 1.0).animate(animation);
            Widget transitionChild = RotationTransition(
              turns: turns,
              child: child,
              alignment: alignment,
            );
            if (useFade) {
              return FadeTransition(
                opacity: animation,
                child: transitionChild,
              );
            }
            return transitionChild;
          },
        );
}

class ProsteSizeRoute extends PageRouteBuilder {
  Widget route;
  Duration duration;
  Duration reverseDuration;
  bool useFade;
  Alignment alignment;
  Axis axis;

  ProsteSizeRoute(
    this.route, {
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    this.useFade = false,
    this.alignment = Alignment.bottomCenter,
    this.axis = Axis.vertical,
  }) : super(
          pageBuilder: (context, _, __) => route,
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          transitionsBuilder: (context, animation, _, child) {
            Widget transitionChild = Align(
              alignment: alignment,
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
                axis: axis,
              ),
            );
            if (useFade) {
              return FadeTransition(
                opacity: animation,
                child: transitionChild,
              );
            }

            return transitionChild;
          },
        );
}
