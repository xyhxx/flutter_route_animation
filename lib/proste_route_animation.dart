library proste_route_animation;

import 'package:flutter/material.dart';
import 'proste_route_animation_class.dart';
import 'proste_route_animation_type.dart';

export 'proste_route_animation_type.dart';

class ProsteRouteAnimation {
  /// use FadeTransition push route
  static Route fadeRoute({
    @required Widget route,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
  }) {
    return FadeRouteAnimation(
      route,
      duration: duration,
      reverseDuration: reverseDuration,
      curve: curve,
    );
  }

  /// use SlideTransition push route
  static Route slideRoute({
    @required Widget route,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    SlideMode mode = SlideMode.fromRight,
    bool useFade = false,
    Curve curve = Curves.linear,
  }) {
    return SlideRouteAnimation(
      route,
      duration: duration,
      reverseDuration: reverseDuration,
      mode: mode,
      useFade: useFade,
      curve: curve,
    );
  }

  /// use ScaleTransition push route
  static Route scaleRoute({
    @required Widget route,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    bool useFade = false,
    Alignment alignment = Alignment.center,
    Curve curve = Curves.linear,
  }) {
    return ScaleRouteAnimation(
      route,
      duration: duration,
      reverseDuration: reverseDuration,
      useFade: useFade,
      alignment: alignment,
      curve: curve,
    );
  }

  /// use RotationTransition push route
  static Route rotationRoute({
    @required Widget route,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    bool useFade = false,
    Alignment alignment = Alignment.bottomCenter,
    Curve curve = Curves.linear,
  }) {
    return RotationRouteAnimation(
      route,
      duration: duration,
      reverseDuration: reverseDuration,
      useFade: useFade,
      alignment: alignment,
      curve: curve,
    );
  }

  /// use SizeTransition push route
  static Route sizeRoute({
    @required Widget route,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    bool useFade = false,
    Alignment alignment = Alignment.bottomCenter,
    Axis axis = Axis.vertical,
    Curve curve = Curves.linear,
  }) {
    return SizeRouteAnimation(
      route,
      duration: duration,
      reverseDuration: reverseDuration,
      useFade: useFade,
      alignment: alignment,
      axis: axis,
      curve: curve,
    );
  }
}
