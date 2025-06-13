class LerpHelper {
  /// Performs linear interpolation (lerp) between two nullable double values.
  ///
  /// This method calculates a value linearly interpolated between [a] and [b]
  /// based on the interpolation factor [t], which typically ranges from 0.0 to 1.0.
  ///
  /// Linear interpolation provides a way to smoothly transition between two values.
  static double? lerpDouble(double? a, double? b, double t) {
    return switch ((a, b)) {
      (null, null) => null,
      (null, final b?) => b,
      (final a?, null) => a,
      (final a?, final b?) => a + (b - a) * t,
    };
  }
}
