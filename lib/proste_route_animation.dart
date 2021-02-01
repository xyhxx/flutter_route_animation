library proste_route_animation;

import 'package:flutter/material.dart';
import 'proste_route_animation_class.dart';
import 'proste_route_animation_type.dart';

export 'proste_route_animation_type.dart';

class ProsteRouteAnimation {
  static Route fadeRoute({
    @required Widget route,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
  }) {
    return FadeRouteAnimation(
      route,
      duration: duration,
      reverseDuration: reverseDuration,
    );
  }

  static Route slideRoute({
    @required Widget route,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    SlideMode mode = SlideMode.fromRight,
    bool useFade = false,
  }) {
    return SlideRouteAnimation(
      route,
      duration: duration,
      reverseDuration: reverseDuration,
      mode: mode,
      useFade: useFade,
    );
  }

  static Route scaleRoute({
    @required Widget route,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    bool useFade = false,
    Alignment alignment = Alignment.center,
  }) {
    return ScaleRouteAnimation(
      route,
      duration: duration,
      reverseDuration: reverseDuration,
      useFade: useFade,
      alignment: alignment,
    );
  }

  static Route rotationRoute({
    @required Widget route,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    bool useFade = false,
    Alignment alignment = Alignment.bottomCenter,
  }) {
    return RotationRouteAnimation(
      route,
      duration: duration,
      reverseDuration: reverseDuration,
      useFade: useFade,
      alignment: alignment,
    );
  }

  static Route sizeRoute({
    @required Widget route,
    Duration duration = const Duration(milliseconds: 300),
    Duration reverseDuration = const Duration(milliseconds: 300),
    bool useFade = false,
    Alignment alignment = Alignment.bottomCenter,
    Axis axis = Axis.vertical,
  }) {
    return SizeRouteAnimation(
      route,
      duration: duration,
      reverseDuration: reverseDuration,
      useFade: useFade,
      alignment: alignment,
      axis: axis,
    );
  }
}
