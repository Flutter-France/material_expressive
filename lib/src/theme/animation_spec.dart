import 'package:material_ui/material_ui.dart';

abstract interface class AnimationSpec<T> {
  const AnimationSpec();
}

abstract class FiniteAnimationSpec<T> extends AnimationSpec<T> {
  const FiniteAnimationSpec({required this.duration, required this.curve});

  final Duration duration;
  final Curve curve;
}
