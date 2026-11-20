import 'package:material_expressive/src/theme/animation_spec.dart';
import 'package:material_ui/material_ui.dart';

/// Implemented from: https://m3.material.io/styles/motion/overview/specs
class MotionScheme {
  const MotionScheme({
    required this.defaultSpatialSpec,
    required this.fastSpatialSpec,
    required this.slowSpatialSpec,
    required this.defaultEffectsSpec,
    required this.fastEffectsSpec,
    required this.slowEffectsSpec,
  });

  final FiniteAnimationSpec defaultSpatialSpec;
  final FiniteAnimationSpec fastSpatialSpec;
  final FiniteAnimationSpec slowSpatialSpec;
  final FiniteAnimationSpec defaultEffectsSpec;
  final FiniteAnimationSpec fastEffectsSpec;
  final FiniteAnimationSpec slowEffectsSpec;
}

class M3EMotionScheme extends MotionScheme {
  const M3EMotionScheme()
    : super(
        defaultSpatialSpec: const _ExpressiveDefaultSpatialSpec(),
        fastSpatialSpec: const _ExpressiveFastSpatialSpec(),
        slowSpatialSpec: const _ExpressiveSlowSpatialSpec(),
        defaultEffectsSpec: const _ExpressiveDefaultEffectsSpec(),
        fastEffectsSpec: const _ExpressiveFastEffectsSpec(),
        slowEffectsSpec: const _ExpressiveSlowEffectsSpec(),
      );
}

class _ExpressiveDefaultSpatialSpec extends FiniteAnimationSpec {
  const _ExpressiveDefaultSpatialSpec()
    : super(
        duration: const Duration(milliseconds: 500),
        curve: const Cubic(0.38, 1.21, 0.22, 1.00),
      );
}

class _ExpressiveFastSpatialSpec extends FiniteAnimationSpec {
  const _ExpressiveFastSpatialSpec()
    : super(
        duration: const Duration(milliseconds: 350),
        curve: const Cubic(0.42, 1.67, 0.21, 0.90),
      );
}

class _ExpressiveSlowSpatialSpec extends FiniteAnimationSpec {
  const _ExpressiveSlowSpatialSpec()
    : super(
        duration: const Duration(milliseconds: 650),
        curve: const Cubic(0.39, 1.29, 0.35, 0.98),
      );
}

class _ExpressiveDefaultEffectsSpec extends FiniteAnimationSpec {
  const _ExpressiveDefaultEffectsSpec()
    : super(
        duration: const Duration(milliseconds: 200),
        curve: const Cubic(0.34, 0.80, 0.34, 1.00),
      );
}

class _ExpressiveFastEffectsSpec extends FiniteAnimationSpec {
  const _ExpressiveFastEffectsSpec()
    : super(
        duration: const Duration(milliseconds: 150),
        curve: const Cubic(0.31, 0.94, 0.34, 1.00),
      );
}

class _ExpressiveSlowEffectsSpec extends FiniteAnimationSpec {
  const _ExpressiveSlowEffectsSpec()
    : super(
        duration: const Duration(milliseconds: 300),
        curve: const Cubic(0.34, 0.88, 0.34, 1.00),
      );
}
