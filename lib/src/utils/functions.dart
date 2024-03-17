import 'package:flutter/material.dart';

Color darkenColor(Color color, {double factor = 0.1}) {
  assert(factor >= 0 && factor <= 1);
  final hslColor = HSLColor.fromColor(color);
  final darkerColor = hslColor.withLightness((hslColor.lightness - factor).clamp(0.0, 1.0));
  return darkerColor.toColor();
}