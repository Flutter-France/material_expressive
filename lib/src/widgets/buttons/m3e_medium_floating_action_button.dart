import 'package:flutter/material.dart';
import 'package:material_expressive/src/theme/m3e_theme.dart';
import 'package:material_expressive/src/utils/debug_check_has_expressive_material.dart';

class M3EMediumFloatingActionButton extends StatelessWidget {
  const M3EMediumFloatingActionButton({
    super.key,
    this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    required this.onPressed,
    this.mouseCursor,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.enableFeedback,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0);

  /// {@template material_expressive.fab.child}
  /// The widget below this widget in the tree.
  ///
  /// Typically an [Icon].
  /// {@endtemplate}
  final Widget? child;

  /// {@template material_expressive.fab.tooltip}
  /// Text that describes the action that will occur when the button is pressed.
  ///
  /// This text is displayed when the user long-presses on the button and is
  /// used for accessibility.
  /// {@endtemplate}
  final String? tooltip;

  /// {@template material_expressive.fab.foreground_color}
  /// The default foreground color for icons and text within the button.
  ///
  /// If this property is null, then the [FloatingActionButtonThemeData.foregroundColor]
  /// of [ThemeData.floatingActionButtonTheme] is used. If that property is also
  /// null, then the [ColorScheme.onPrimaryContainer] color of [ThemeData.colorScheme]
  /// is used. If [ThemeData.useMaterial3] is set to false, then the
  /// [ColorScheme.onSecondary] color of [ThemeData.colorScheme] is used.
  /// {@endtemplate}
  final Color? foregroundColor;

  /// {@template material_expressive.fab.background_color}
  /// The button's background color.
  ///
  /// If this property is null, then the [FloatingActionButtonThemeData.backgroundColor]
  /// of [ThemeData.floatingActionButtonTheme] is used. If that property is also
  /// null, then the [ColorScheme.primaryContainer] color of [ThemeData.colorScheme]
  /// is used. If [ThemeData.useMaterial3] is set to false, then the
  /// [ColorScheme.secondary] color of [ThemeData.colorScheme] is used.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template material_expressive.fab.focus_color}
  /// The color to use for filling the button when the button has input focus.
  ///
  /// In Material 3, defaults to [ColorScheme.onPrimaryContainer] with opacity 0.1.
  /// In Material 2, it defaults to [ThemeData.focusColor] for the current theme.
  /// {@endtemplate}
  final Color? focusColor;

  /// {@template material_expressive.fab.hover_color}
  /// The color to use for filling the button when the button has a pointer
  /// hovering over it.
  ///
  /// Defaults to [ThemeData.hoverColor] for the current theme in Material 2. In
  /// Material 3, defaults to [ColorScheme.onPrimaryContainer] with opacity 0.08.
  /// {@endtemplate}
  final Color? hoverColor;

  /// {@template material_expressive.fab.splash_color}
  /// The splash color for this [M3EMediumFloatingActionButton]'s [InkWell].
  ///
  /// If null, [FloatingActionButtonThemeData.splashColor] is used, if that is
  /// null, [ThemeData.splashColor] is used in Material 2; [ColorScheme.onPrimaryContainer]
  /// with opacity 0.1 is used in Material 3.
  /// {@endtemplate}
  final Color? splashColor;

  /// {@template material_expressive.fab.hero_tag}
  /// The tag to apply to the button's [Hero] widget.
  ///
  /// Defaults to a tag that matches other floating action buttons.
  ///
  /// Set this to null explicitly if you don't want the floating action button to
  /// have a hero tag.
  ///
  /// If this is not explicitly set, then there can only be one
  /// [M3EMediumFloatingActionButton] per route (that is, per screen), since otherwise
  /// there would be a tag conflict (multiple heroes on one route can't have the
  /// same tag). The Material Design specification recommends only using one
  /// floating action button per screen.
  /// {@endtemplate}
  final Object? heroTag;

  /// {@template material_expressive.fab.on_pressed}
  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  /// {@endtemplate}
  final VoidCallback? onPressed;

  /// {@template material_expressive.fab.mouse_cursor}
  /// {@macro flutter.material.RawMaterialButton.mouseCursor}
  ///
  /// If this property is null, [WidgetStateMouseCursor.clickable] will be used.
  /// {@endtemplate}
  final MouseCursor? mouseCursor;

  /// {@template material_expressive.fab.elevation}
  /// The z-coordinate at which to place this button relative to its parent.
  ///
  /// This controls the size of the shadow below the floating action button.
  ///
  /// Defaults to 6, the appropriate elevation for floating action buttons. The
  /// value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [highlightElevation], the elevation when the button is pressed.
  ///  * [disabledElevation], the elevation when the button is disabled.
  /// {@endtemplate}
  final double? elevation;

  /// {@template material_expressive.fab.focus_elevation}
  /// The z-coordinate at which to place this button relative to its parent when
  /// the button has the input focus.
  ///
  /// This controls the size of the shadow below the floating action button.
  ///
  /// Defaults to 8, the appropriate elevation for floating action buttons
  /// while they have focus. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [highlightElevation], the elevation when the button is pressed.
  ///  * [disabledElevation], the elevation when the button is disabled.
  /// {@endtemplate}
  final double? focusElevation;

  /// {@template material_expressive.fab.hover_elevation}
  /// The z-coordinate at which to place this button relative to its parent when
  /// the button is enabled and has a pointer hovering over it.
  ///
  /// This controls the size of the shadow below the floating action button.
  ///
  /// Defaults to 8, the appropriate elevation for floating action buttons while
  /// they have a pointer hovering over them. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [highlightElevation], the elevation when the button is pressed.
  ///  * [disabledElevation], the elevation when the button is disabled.
  /// {@endtemplate}
  final double? hoverElevation;

  /// {@template material_expressive.fab.highlight_elevation}
  /// The z-coordinate at which to place this button relative to its parent when
  /// the user is touching the button.
  ///
  /// This controls the size of the shadow below the floating action button.
  ///
  /// Defaults to 12, the appropriate elevation for floating action buttons
  /// while they are being touched. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  /// {@endtemplate}
  final double? highlightElevation;

  /// {@template material_expressive.fab.disabled_elevation}
  /// The z-coordinate at which to place this button when the button is disabled
  /// ([onPressed] is null).
  ///
  /// This controls the size of the shadow below the floating action button.
  ///
  /// Defaults to the same value as [elevation]. Setting this to zero makes the
  /// floating action button work similar to an [ElevatedButton] but the titular
  /// "floating" effect is lost. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [highlightElevation], the elevation when the button is pressed.
  /// {@endtemplate}
  final double? disabledElevation;

  /// {@template material_expressive.fab.shape}
  /// The shape of the button's [Material].
  ///
  /// The button's highlight and splash are clipped to this shape. If the
  /// button has an elevation, then its drop shadow is defined by this
  /// shape as well.
  /// {@endtemplate}
  final ShapeBorder? shape;

  /// {@template material_expressive.fab.clip_behavior}
  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none].
  /// {@endtemplate}
  final Clip clipBehavior;

  /// {@template material_expressive.fab.focus_node}
  /// {@macro flutter.widgets.Focus.focusNode}
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template material_expressive.fab.autofocus}
  /// {@macro flutter.widgets.Focus.autofocus}
  /// {@endtemplate}
  final bool autofocus;

  /// {@template material_expressive.fab.material_tap_target_size}
  /// Configures the minimum size of the tap target.
  ///
  /// Defaults to [ThemeData.materialTapTargetSize].
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  /// {@endtemplate}
  final MaterialTapTargetSize? materialTapTargetSize;

  /// {@template material_expressive.fab.enable_feedback}
  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// If null, [FloatingActionButtonThemeData.enableFeedback] is used.
  /// If both are null, then default value is true.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  /// {@endtemplate}
  final bool? enableFeedback;

  @override
  Widget build(BuildContext context) {
    debugCheckHasExpressiveMaterial(context);

    final theme = Theme.of(context);
    final floatingActionButtonTheme = theme.floatingActionButtonTheme;
    final m3eFabTheme = theme.extension<M3ETheme>()?.floatingActionButtonTheme;
    const defaults = _MediumFABDefaultsM3E();

    final iconSize = floatingActionButtonTheme.iconSize ?? defaults.iconSize;
    final shape =
        this.shape ?? floatingActionButtonTheme.shape ?? defaults.shape;
    final sizeConstraints =
        m3eFabTheme?.mediumSizeConstraints ?? defaults.mediumSizeConstraints;

    return Theme(
      data: theme.copyWith(
        floatingActionButtonTheme: floatingActionButtonTheme.copyWith(
          sizeConstraints: sizeConstraints,
          iconSize: iconSize,
        ),
      ),
      child: FloatingActionButton(
        child: child,
        tooltip: tooltip,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        splashColor: splashColor,
        heroTag: heroTag,
        elevation: elevation,
        focusElevation: focusElevation,
        hoverElevation: hoverElevation,
        highlightElevation: highlightElevation,
        disabledElevation: disabledElevation,
        onPressed: onPressed,
        mouseCursor: mouseCursor,
        shape: shape,
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        autofocus: autofocus,
        materialTapTargetSize: materialTapTargetSize,
        enableFeedback: enableFeedback,
      ),
    );
  }
}

class _MediumFABDefaultsM3E extends FloatingActionButtonThemeData {
  const _MediumFABDefaultsM3E()
    : mediumSizeConstraints = const BoxConstraints.tightFor(
        width: 80.0,
        height: 80.0,
      );

  final BoxConstraints mediumSizeConstraints;

  @override
  ShapeBorder get shape => const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  );

  @override
  double get iconSize => 28.0;
}
