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
    return expanded ? _CloseButton(onPressed: onClosePressed) : button;
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
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
}
