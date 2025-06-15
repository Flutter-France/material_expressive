import 'package:flutter/material.dart';

class M3EExtendedFloatingActionButton extends StatelessWidget {
  const M3EExtendedFloatingActionButton({super.key, this.child, this.tooltip});

  const M3EExtendedFloatingActionButton.medium({
    super.key,
    this.child,
    this.tooltip,
  });

  const M3EExtendedFloatingActionButton.large({
    super.key,
    this.child,
    this.tooltip,
  });

  /// {@macro material_expressive.fab.child}
  final Widget? child;

  /// {@macro material_expressive.fab.tooltip}
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
