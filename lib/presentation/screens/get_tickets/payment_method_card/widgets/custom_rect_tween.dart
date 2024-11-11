import 'dart:ui';
import 'package:flutter/widgets.dart';

/// {@template custom_rect_tween}
/// Linear RectTween with a [Curves.easeOut] curve.
/// 
/// Less dramatic than the regular [RectTween] used in [Hero] animations.
/// {@endtemplate}
class CustomRectTween extends RectTween {
  /// {@macro custom_rect_tween}
  CustomRectTween({
    required super.begin,
    required super.end,
  });

  @override
  Rect lerp(double t) {
    // Obtén el valor transformado de la curva para suavizar la animación
    final curveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin!.left, end!.left, curveValue) ?? 0.0,
      lerpDouble(begin!.top, end!.top, curveValue) ?? 0.0,
      lerpDouble(begin!.right, end!.right, curveValue) ?? 0.0,
      lerpDouble(begin!.bottom, end!.bottom, curveValue) ?? 0.0,
    );
  }
}
