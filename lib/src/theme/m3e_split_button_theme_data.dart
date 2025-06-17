import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
class M3ESplitButtonThemeData with Diagnosticable {
  final double? spacing;

  const M3ESplitButtonThemeData({this.spacing});

  M3ESplitButtonThemeData lerp(M3ESplitButtonThemeData? other, double t) {
    return switch (other) {
      null => this,
      final other =>
        identical(this, other)
            ? this
            : M3ESplitButtonThemeData(
              spacing: lerpDouble(spacing, other.spacing, t),
            ),
    };
  }
}
