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

  M3EFloatingActionButtonThemeData lerp(
    M3EFloatingActionButtonThemeData? other,
    double t,
  ) {
    return switch (other) {
      null => this,
      final b => () {
        if (identical(this, b)) return this;
        return M3EFloatingActionButtonThemeData(
          mediumSizeConstraints: BoxConstraints.lerp(
            mediumSizeConstraints,
            b.mediumSizeConstraints,
            t,
          ),
          extendedSmallSizeConstraints: BoxConstraints.lerp(
            extendedSmallSizeConstraints,
            b.extendedSmallSizeConstraints,
            t,
          ),
          extendedMediumSizeConstraints: BoxConstraints.lerp(
            extendedMediumSizeConstraints,
            b.extendedMediumSizeConstraints,
            t,
          ),
          extendedLargeSizeConstraints: BoxConstraints.lerp(
            extendedLargeSizeConstraints,
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
