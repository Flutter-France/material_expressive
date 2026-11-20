import 'package:material_ui/material_ui.dart';

abstract interface class AnimationSpec<T> {
  const AnimationSpec();
}

abstract class FiniteAnimationSpec<T> extends AnimationSpec<T> {
  const FiniteAnimationSpec({required this.duration, required this.curve});

  final Duration duration;
  final Curve curve;
}

/// A spring motion token: no fixed duration, settles by physics.
///
/// Values from https://m3.material.io/styles/motion/overview/specs.
class SpringSpec<T> extends AnimationSpec<T> {
  const SpringSpec({required this.dampingRatio, required this.stiffness});

  static const expressiveSpatialFast = SpringSpec(
    dampingRatio: 0.6,
    stiffness: 800,
  );
  static const expressiveEffectsFast = SpringSpec(
    dampingRatio: 1,
    stiffness: 3800,
  );

  final double dampingRatio;
  final double stiffness;

  SpringDescription get description => SpringDescription.withDampingRatio(
    mass: 1,
    stiffness: stiffness,
    ratio: dampingRatio,
  );
}
