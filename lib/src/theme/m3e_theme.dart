import 'package:flutter/material.dart';
import 'package:material_expressive/src/theme/m3e_split_button_theme_data.dart';
import 'package:material_expressive/src/theme/motion_scheme.dart';

import 'm3e_floating_action_button_theme_data.dart';

class M3ETheme extends ThemeExtension<M3ETheme> {
  const M3ETheme({this.floatingActionButtonTheme, this.splitButtonTheme})
    : motionScheme = const M3EMotionScheme();

  final MotionScheme motionScheme;
  final M3EFloatingActionButtonThemeData? floatingActionButtonTheme;
  final M3ESplitButtonThemeData? splitButtonTheme;

  @override
  M3ETheme copyWith({
    M3EFloatingActionButtonThemeData? floatingActionButtonTheme,
    M3ESplitButtonThemeData? splitButtonTheme,
  }) {
    return M3ETheme(
      floatingActionButtonTheme:
          floatingActionButtonTheme ?? this.floatingActionButtonTheme,
      splitButtonTheme: splitButtonTheme ?? this.splitButtonTheme,
    );
  }

  @override
  M3ETheme lerp(M3ETheme? other, double t) {
    if (other == null || identical(this, other)) return this;
    return M3ETheme(
      floatingActionButtonTheme: M3EFloatingActionButtonThemeData.lerp(
        floatingActionButtonTheme,
        other.floatingActionButtonTheme,
        t,
      ),
      splitButtonTheme: M3ESplitButtonThemeData.lerp(
        splitButtonTheme,
        other.splitButtonTheme,
        t,
      ),
    );
  }
}
