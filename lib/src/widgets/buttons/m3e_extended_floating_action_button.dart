import 'package:flutter/material.dart';

class _DefaultHeroTag {
  const _DefaultHeroTag();

  @override
  String toString() => '<default M3EExtendedFloatingActionButton tag>';
}

class M3EExtendedFloatingActionButton extends StatelessWidget {
  const M3EExtendedFloatingActionButton({
    super.key,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.heroTag = const _DefaultHeroTag(),
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.splashColor,
    this.highlightElevation,
    this.disabledElevation,
    required this.onPressed,
    this.mouseCursor = SystemMouseCursors.click,
    this.shape,
    this.materialTapTargetSize,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.extendedIconLabelSpacing,
    this.extendedPadding,
    this.extendedTextStyle,
    this.icon,
    required this.label,
    this.enableFeedback,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0),
       _floatingActionButtonType = _M3EExtendedFloatingActionButtonSize.regular;

  const M3EExtendedFloatingActionButton.medium({
    super.key,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.heroTag = const _DefaultHeroTag(),
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.splashColor,
    this.highlightElevation,
    this.disabledElevation,
    required this.onPressed,
    this.mouseCursor = SystemMouseCursors.click,
    this.shape,
    this.materialTapTargetSize,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.extendedIconLabelSpacing,
    this.extendedPadding,
    this.extendedTextStyle,
    this.icon,
    required this.label,
    this.enableFeedback,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0),
       _floatingActionButtonType = _M3EExtendedFloatingActionButtonSize.medium;

  const M3EExtendedFloatingActionButton.large({
    super.key,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.heroTag = const _DefaultHeroTag(),
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.splashColor,
    this.highlightElevation,
    this.disabledElevation,
    required this.onPressed,
    this.mouseCursor = SystemMouseCursors.click,
    this.shape,
    this.materialTapTargetSize,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.extendedIconLabelSpacing,
    this.extendedPadding,
    this.extendedTextStyle,
    this.icon,
    required this.label,
    this.enableFeedback,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0),
       _floatingActionButtonType = _M3EExtendedFloatingActionButtonSize.large;

  /// {@macro material_expressive.fab.tooltip}
  final String? tooltip;

  /// {@macro material_expressive.fab.foreground_color}
  final Color? foregroundColor;

  /// {@macro material_expressive.fab.background_color}
  final Color? backgroundColor;

  /// {@macro material_expressive.fab.focus_color}
  final Color? focusColor;

  /// {@macro material_expressive.fab.hover_color}
  final Color? hoverColor;

  /// {@macro material_expressive.fab.hero_tag}
  final Object? heroTag;

  /// {@macro material_expressive.fab.elevation}
  final double? elevation;

  /// {@macro material_expressive.fab.focus_elevation}
  final double? focusElevation;

  /// {@macro material_expressive.fab.hover_elevation}
  final double? hoverElevation;

  /// {@macro material_expressive.fab.splash_color}
  final Color? splashColor;

  /// {@macro material_expressive.fab.highlight_elevation}
  final double? highlightElevation;

  /// {@macro material_expressive.fab.disabled_elevation}
  final double? disabledElevation;

  /// {@macro material_expressive.fab.on_pressed}
  final VoidCallback? onPressed;

  /// {@macro material_expressive.fab.mouse_cursor}
  final MouseCursor mouseCursor;

  /// {@macro material_expressive.fab.shape}
  final ShapeBorder? shape;

  /// {@macro material_expressive.fab.material_tap_target_size}
  final MaterialTapTargetSize? materialTapTargetSize;

  /// {@macro material_expressive.fab.clip_behavior}
  final Clip clipBehavior;

  /// {@macro material_expressive.fab.focus_node}
  final FocusNode? focusNode;

  /// {@macro material_expressive.fab.autofocus}
  final bool autofocus;

  /// The spacing between the icon and the label for an extended
  /// [FloatingActionButton].
  ///
  /// If null, [FloatingActionButtonThemeData.extendedIconLabelSpacing] is used.
  /// If that is also null, the default is 8.0.
  final double? extendedIconLabelSpacing;

  /// The padding for an extended [M3EExtendedFloatingActionButton]'s content.
  ///
  /// If null, [FloatingActionButtonThemeData.extendedPadding] is used. If that
  /// is also null, the default is
  /// `EdgeInsetsDirectional.only(start: 16.0, end: 20.0)` if an icon is
  /// provided, and `EdgeInsetsDirectional.only(start: 20.0, end: 20.0)` if not.
  final EdgeInsetsGeometry? extendedPadding;

  /// The text style for an extended [M3EExtendedFloatingActionButton]'s label.
  ///
  /// If null, [FloatingActionButtonThemeData.extendedTextStyle] is used. If
  /// that is also null, then [TextTheme.labelLarge] with a letter spacing of 1.2
  /// is used.
  final TextStyle? extendedTextStyle;

  /// {@macro material_expressive.fab.child}
  final Widget? icon;

  final Widget label;

  /// {@macro material_expressive.fab.enable_feedback}
  final bool? enableFeedback;

  final _M3EExtendedFloatingActionButtonSize _floatingActionButtonType;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

enum _M3EExtendedFloatingActionButtonSize { regular, medium, large }
