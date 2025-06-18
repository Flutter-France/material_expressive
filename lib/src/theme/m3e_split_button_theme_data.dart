import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class M3ESplitButtonThemeData with Diagnosticable {
  final double? spacing;
  final M3ESplitButtonStyle? extraSmallButtonStyle;
  final M3ESplitButtonStyle? smallButtonStyle;
  final M3ESplitButtonStyle? mediumButtonStyle;
  final M3ESplitButtonStyle? largeButtonStyle;
  final M3ESplitButtonStyle? extraLargeButtonStyle;

  const M3ESplitButtonThemeData({
    this.spacing,
    this.extraSmallButtonStyle,
    this.smallButtonStyle,
    this.mediumButtonStyle,
    this.largeButtonStyle,
    this.extraLargeButtonStyle,
  });

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

class M3ESplitButtonStyle {
  M3ESplitButtonStyle({required this.leading, required this.trailing});

  final ButtonStyle? leading;
  final ButtonStyle? trailing;
}
