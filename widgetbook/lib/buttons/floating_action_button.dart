import 'package:flutter/material.dart';
import 'package:material_expressive/material_expressive.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'FAB', type: M3EFloatingActionButton)
Widget buildFloatingActionButton(BuildContext context) {
  final size = context.knobs.list<M3EFloatingActionButtonType>(
    label: 'Size',
    options: M3EFloatingActionButtonType.values,
    labelBuilder: (s) => s.name,
  );

  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);

  final style = context.knobs.list<_FABStyle>(
    label: 'Style',
    options: _FABStyle.values,
    labelBuilder: (s) => s.label,
  );

  final (:backColor, :onColor) = style.colorFetcher(Theme.of(context));

  return M3EFloatingActionButton(
    onPressed: enabled ? () {} : null,
    floatingActionButtonType: size,
    backgroundColor: backColor,
    child: Icon(Icons.stars),
  );
}

@widgetbook.UseCase(name: 'Extended FAB', type: M3EExtendedFloatingActionButton)
Widget buildExtendedFloatingActionButton(BuildContext context) {
  final theme = Theme.of(context);
  final size = context.knobs.list<M3EFloatingActionButtonType>(
    label: 'Size',
    options: M3EFloatingActionButtonType.values,
    labelBuilder: (s) => s.name,
  );

  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);

  final style = context.knobs.list<_FABStyle>(
    label: 'Style',
    options: _FABStyle.values,
    labelBuilder: (s) => s.label,
  );

  final onPressed = enabled ? () {} : null;
  const icon = Icon(Icons.stars);
  const label = Text('Label');

  final (:backColor, :onColor) = style.colorFetcher(theme);

  return switch (size) {
    M3EFloatingActionButtonType.small => M3EExtendedFloatingActionButton.small(
      onPressed: onPressed,
      backgroundColor: backColor,
      foregroundColor: onColor,
      icon: icon,
      label: label,
    ),
    M3EFloatingActionButtonType.medium =>
      M3EExtendedFloatingActionButton.medium(
        onPressed: onPressed,
        backgroundColor: backColor,
        foregroundColor: onColor,
        icon: icon,
        label: label,
      ),
    M3EFloatingActionButtonType.large => M3EExtendedFloatingActionButton.large(
      onPressed: onPressed,
      backgroundColor: backColor,
      foregroundColor: onColor,
      icon: icon,
      label: label,
    ),
  };
}

typedef _ColorRecord = ({Color backColor, Color onColor});
typedef _ColorFetcher = _ColorRecord Function(ThemeData theme);

enum _FABStyle {
  primaryContainer('Primary container', _primaryContainer),
  secondaryContainer('Secondary container', _secondaryContainer),
  tertiaryContainer('Tertiary container', _tertiaryContainer),
  primary('Primary', _primary),
  secondary('Secondary', _secondary),
  tertiary('Tertiary', _tertiary);

  const _FABStyle(this.label, this.colorFetcher);

  final String label;
  final _ColorFetcher colorFetcher;

  static _ColorRecord _primaryContainer(ThemeData theme) {
    return (
      backColor: theme.colorScheme.primaryContainer,
      onColor: theme.colorScheme.onPrimaryContainer,
    );
  }

  static _ColorRecord _secondaryContainer(ThemeData theme) {
    return (
      backColor: theme.colorScheme.secondaryContainer,
      onColor: theme.colorScheme.onSecondaryContainer,
    );
  }

  static _ColorRecord _tertiaryContainer(ThemeData theme) {
    return (
      backColor: theme.colorScheme.tertiaryContainer,
      onColor: theme.colorScheme.onTertiaryContainer,
    );
  }

  static _ColorRecord _primary(ThemeData theme) {
    return (
      backColor: theme.colorScheme.primary,
      onColor: theme.colorScheme.onPrimary,
    );
  }

  static _ColorRecord _secondary(ThemeData theme) {
    return (
      backColor: theme.colorScheme.secondary,
      onColor: theme.colorScheme.onSecondary,
    );
  }

  static _ColorRecord _tertiary(ThemeData theme) {
    return (
      backColor: theme.colorScheme.tertiary,
      onColor: theme.colorScheme.onTertiary,
    );
  }
}
