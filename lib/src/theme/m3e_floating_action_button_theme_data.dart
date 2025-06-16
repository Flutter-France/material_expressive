import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class M3EFloatingActionButtonThemeData with Diagnosticable {
  const M3EFloatingActionButtonThemeData({
    this.mediumSizeConstraints,
    this.extendedSmallSizeConstraints,
    this.extendedMediumSizeConstraints,
    this.extendedLargeSizeConstraints,
  });

  /// Overrides the default size constraints for [M3EFloatingActionButton.medium].
  final BoxConstraints? mediumSizeConstraints;

  /// Overrides the default size constraints for
  /// [M3EExtendedFloatingActionButton.small].
  final BoxConstraints? extendedSmallSizeConstraints;

  /// Overrides the default size constraints for
  /// [M3EExtendedFloatingActionButton.medium].
  final BoxConstraints? extendedMediumSizeConstraints;

  /// Overrides the default size constraints for
  /// [M3EExtendedFloatingActionButton.large].
  final BoxConstraints? extendedLargeSizeConstraints;

  M3EFloatingActionButtonThemeData copyWith({
    BoxConstraints? mediumSizeConstraints,
    BoxConstraints? extendedSmallSizeConstraints,
    BoxConstraints? extendedMediumSizeConstraints,
    BoxConstraints? extendedLargeSizeConstraints,
  }) {
    return M3EFloatingActionButtonThemeData(
      mediumSizeConstraints:
          mediumSizeConstraints ?? this.mediumSizeConstraints,
      extendedSmallSizeConstraints:
          extendedSmallSizeConstraints ?? this.extendedSmallSizeConstraints,
      extendedMediumSizeConstraints:
          extendedMediumSizeConstraints ?? this.extendedMediumSizeConstraints,
      extendedLargeSizeConstraints:
          extendedLargeSizeConstraints ?? this.extendedLargeSizeConstraints,
    );
  }

  static M3EFloatingActionButtonThemeData? lerp(
    M3EFloatingActionButtonThemeData? a,
    M3EFloatingActionButtonThemeData? b,
    double t,
  ) {
    return switch ((a, b)) {
      (null, null) => null,
      (null, final b?) => b,
      (final a?, null) => a,
      (final a?, final b?) => () {
        if (identical(a, b)) return a;
        return M3EFloatingActionButtonThemeData(
          mediumSizeConstraints: BoxConstraints.lerp(
            a.mediumSizeConstraints,
            b.mediumSizeConstraints,
            t,
          ),
          extendedSmallSizeConstraints: BoxConstraints.lerp(
            a.extendedSmallSizeConstraints,
            b.extendedSmallSizeConstraints,
            t,
          ),
          extendedMediumSizeConstraints: BoxConstraints.lerp(
            a.extendedMediumSizeConstraints,
            b.extendedMediumSizeConstraints,
            t,
          ),
          extendedLargeSizeConstraints: BoxConstraints.lerp(
            a.extendedLargeSizeConstraints,
            b.extendedLargeSizeConstraints,
            t,
          ),
        );
      }(),
    };
  }

  @override
  int get hashCode => Object.hash(
    mediumSizeConstraints,
    extendedSmallSizeConstraints,
    extendedMediumSizeConstraints,
    extendedLargeSizeConstraints,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is M3EFloatingActionButtonThemeData &&
        runtimeType == other.runtimeType &&
        other.mediumSizeConstraints == mediumSizeConstraints &&
        other.extendedSmallSizeConstraints == extendedSmallSizeConstraints &&
        other.extendedMediumSizeConstraints == extendedMediumSizeConstraints &&
        other.extendedLargeSizeConstraints == extendedLargeSizeConstraints;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<BoxConstraints>(
        'mediumSizeConstraints',
        mediumSizeConstraints,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<BoxConstraints>(
        'extendedSmallSizeConstraints',
        extendedSmallSizeConstraints,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<BoxConstraints>(
        'extendedMediumSizeConstraints',
        extendedMediumSizeConstraints,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<BoxConstraints>(
        'extendedLargeSizeConstraints',
        extendedLargeSizeConstraints,
        defaultValue: null,
      ),
    );
  }
}
