import 'package:flutter/material.dart';
import 'package:material_expressive/material_expressive.dart';

class M3EFloatingActionButtonMenu extends StatelessWidget {
  const M3EFloatingActionButtonMenu({
    required this.button,
    required this.onClosePressed,
    required this.items,
    this.expanded = false,
    super.key,
  }) : assert(items.length > 0);

  /// Whether the FAB menu is expanded, which will trigger a staggered animation
  /// of the FAB menu items.
  final bool expanded;

  /// A button widget which triggers the showing and hiding of the FAB menu
  /// items via the [expanded] state, typically an [M3EFloatingActionButton].
  final Widget button;

  final VoidCallback onClosePressed;

  final List<M3EFloatingActionButtonMenuItem> items;

  @override
  Widget build(BuildContext context) {
    final m3eTheme = M3ETheme.of(context);
    final motionScheme = m3eTheme.motionScheme;

    final morphSpec = motionScheme.fastSpatialSpec;

    return AnimatedSize(
      duration: morphSpec.duration,
      curve: morphSpec.curve,
      alignment: Alignment.topRight,
      child: expanded ? _CloseButton(onPressed: onClosePressed) : button,
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return M3EFloatingActionButton.small(
      onPressed: onPressed,
      triggerEntryAnimation: false,
      shape: CircleBorder(),
      child: Icon(Icons.close, size: 20),
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
    );
  }
}

class M3EFloatingActionButtonMenuItem {
  const M3EFloatingActionButtonMenuItem({
    required this.text,
    required this.icon,
    required this.onPressed,
    this.containerColor,
    this.contentColor,
  });

  final Widget text;
  final Widget icon;
  final VoidCallback onPressed;
  final Color? containerColor;
  final Color? contentColor;
}
