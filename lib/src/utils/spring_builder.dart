import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_ui/material_ui.dart';

import '../theme/animation_spec.dart';

/// Converts a value to a list of numbers a spring can animate, and back.
class SpringConverter<T> {
  const SpringConverter({required this.normalize, required this.denormalize});

  final List<double> Function(T value) normalize;
  final T Function(List<double> values) denormalize;
}

final doubleSpringConverter = SpringConverter<double>(
  normalize: (v) => [v],
  denormalize: (v) => v[0],
);

/// Springs overshoot, so components are clamped back into range.
final colorSpringConverter = SpringConverter<Color>(
  normalize: (c) => [c.a, c.r, c.g, c.b],
  denormalize: (v) => Color.from(
    alpha: clampDouble(v[0], 0, 1),
    red: clampDouble(v[1], 0, 1),
    green: clampDouble(v[2], 0, 1),
    blue: clampDouble(v[3], 0, 1),
  ),
);

/// Springs can overshoot below zero, so radii are clamped.
final borderRadiusSpringConverter = SpringConverter<BorderRadius>(
  normalize: (r) => [
    r.topLeft.x,
    r.topRight.x,
    r.bottomLeft.x,
    r.bottomRight.x,
  ],
  denormalize: (v) => BorderRadius.only(
    topLeft: Radius.circular(math.max(0, v[0])),
    topRight: Radius.circular(math.max(0, v[1])),
    bottomLeft: Radius.circular(math.max(0, v[2])),
    bottomRight: Radius.circular(math.max(0, v[3])),
  ),
);

/// Animates towards [value] with [spring] whenever [value] changes.
///
/// Each component of the [converter] output runs its own spring. When the
/// target changes mid-flight, the springs restart from the current position
/// with the current velocity, so interrupted motion stays smooth.
class SpringBuilder<T> extends StatefulWidget {
  const SpringBuilder({
    required this.value,
    required this.spring,
    required this.converter,
    required this.builder,
    this.child,
    super.key,
  });

  final T value;
  final SpringSpec spring;
  final SpringConverter<T> converter;
  final ValueWidgetBuilder<T> builder;
  final Widget? child;

  @override
  State<SpringBuilder<T>> createState() => _SpringBuilderState<T>();
}

class _SpringBuilderState<T> extends State<SpringBuilder<T>>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker = createTicker(_tick);
  late List<double> _target = widget.converter.normalize(widget.value);
  late List<double> _position = [..._target];
  late List<double> _velocity = List.filled(_target.length, 0);
  List<SpringSimulation> _simulations = const [];

  @override
  void didUpdateWidget(SpringBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final target = widget.converter.normalize(widget.value);
    if (listEquals(target, _target)) return;
    assert(target.length == _target.length);
    _target = target;
    final description = widget.spring.description;
    _simulations = [
      for (var i = 0; i < target.length; i++)
        SpringSimulation(description, _position[i], target[i], _velocity[i]),
    ];
    _ticker
      ..stop()
      ..start();
  }

  void _tick(Duration elapsed) {
    final t = elapsed.inMicroseconds / Duration.microsecondsPerSecond;
    var done = true;
    for (var i = 0; i < _simulations.length; i++) {
      _position[i] = _simulations[i].x(t);
      _velocity[i] = _simulations[i].dx(t);
      done = done && _simulations[i].isDone(t);
    }
    if (done) {
      _ticker.stop();
      _position = [..._target];
      _velocity = List.filled(_target.length, 0);
    }
    setState(() {});
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(
    context,
    widget.converter.denormalize(_position),
    widget.child,
  );
}
