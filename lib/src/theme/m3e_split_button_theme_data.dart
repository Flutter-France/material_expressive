import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
class M3ESplitButtonThemeData with Diagnosticable {
  final double? spacing;

  const M3ESplitButtonThemeData({this.spacing});

  static M3ESplitButtonThemeData? lerp(
    M3ESplitButtonThemeData? a,
    M3ESplitButtonThemeData? b,
    double t,
  ) {
    return switch ((a, b)) {
      (null, null) => null,
      (null, final b?) => b,
      (final a?, null) => a,
      (final a?, final b?) =>
        identical(a, b)
            ? a
            : M3ESplitButtonThemeData(
              spacing: lerpDouble(a.spacing, b.spacing, t),
            ),
    };
  }
}
