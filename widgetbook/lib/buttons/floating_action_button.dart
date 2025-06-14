import 'package:flutter/material.dart';
import 'package:material_expressive/material_expressive.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Medium', type: M3EMediumFloatingActionButton)
Widget buildSecondaryFloatingActionButton(BuildContext context) {
  final enabled = context.knobs.boolean(
    label: 'Enabled',
    description: 'Whether the button is enabled or not',
    initialValue: true,
  );

  final style = context.knobs.list<_FABStyle>(
    label: 'Style',
    options: _FABStyle.values,
    labelBuilder: (s) => s.name,
  );

  return M3EMediumFloatingActionButton(
    onPressed: enabled ? () {} : null,
    backgroundColor: style.backgroundColor(context),
    child: Icon(Icons.stars),
  );
}

typedef _ColorFetcher = Color Function(BuildContext context);

enum _FABStyle {
  primaryContainer(
    'Primary container',
    _primaryContainerBackground,
    _primaryContainerForeground,
  ),
  secondaryContainer(
    'Secondary container',
    _secondaryContainerBackground,
    _secondaryContainerForeground,
  ),
  tertiaryContainer(
    'Tertiary container',
    _tertiaryContainerBackground,
    _tertiaryContainerForeground,
  ),
  primary('Primary', _primaryBackground, _primaryForeground),
  secondary('Secondary', _secondaryBackground, _secondaryForeground),
  tertiary('Tertiary', _tertiaryBackground, _tertiaryForeground);

  const _FABStyle(this.label, this.backgroundColor, this.foregroundColor);

  final String label;
  final _ColorFetcher backgroundColor;
  final _ColorFetcher foregroundColor;

  static Color _primaryContainerBackground(BuildContext context) {
    return Theme.of(context).colorScheme.primaryContainer;
  }

  static Color _primaryContainerForeground(BuildContext context) {
    return Theme.of(context).colorScheme.onPrimaryContainer;
  }

  static Color _secondaryContainerBackground(BuildContext context) {
    return Theme.of(context).colorScheme.secondaryContainer;
  }

  static Color _secondaryContainerForeground(BuildContext context) {
    return Theme.of(context).colorScheme.onSecondaryContainer;
  }

  static Color _tertiaryContainerBackground(BuildContext context) {
    return Theme.of(context).colorScheme.tertiaryContainer;
  }

  static Color _tertiaryContainerForeground(BuildContext context) {
    return Theme.of(context).colorScheme.onTertiaryContainer;
  }

  static Color _primaryBackground(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  static Color _primaryForeground(BuildContext context) {
    return Theme.of(context).colorScheme.onPrimary;
  }

  static Color _secondaryBackground(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  static Color _secondaryForeground(BuildContext context) {
    return Theme.of(context).colorScheme.onSecondary;
  }

  static Color _tertiaryBackground(BuildContext context) {
    return Theme.of(context).colorScheme.tertiary;
  }

  static Color _tertiaryForeground(BuildContext context) {
    return Theme.of(context).colorScheme.onTertiary;
  }
}
