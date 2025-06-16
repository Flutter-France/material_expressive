import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_expressive/src/theme/m3e_theme.dart';

import 'm3e_floating_action_button.dart';

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
    this.iconLabelSpacing,
    this.padding,
    this.textStyle,
    this.icon,
    required this.label,
    this.enableFeedback,
    this.floatingActionButtonType = M3EFloatingActionButtonType.medium,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0);

  const M3EExtendedFloatingActionButton.small({
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
    this.iconLabelSpacing,
    this.padding,
    this.textStyle,
    this.icon,
    required this.label,
    this.enableFeedback,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0),
       floatingActionButtonType = M3EFloatingActionButtonType.small;

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
    this.iconLabelSpacing,
    this.padding,
    this.textStyle,
    this.icon,
    required this.label,
    this.enableFeedback,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0),
       floatingActionButtonType = M3EFloatingActionButtonType.medium;

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
    this.iconLabelSpacing,
    this.padding,
    this.textStyle,
    this.icon,
    required this.label,
    this.enableFeedback,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0),
       floatingActionButtonType = M3EFloatingActionButtonType.large;

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
  final double? iconLabelSpacing;

  /// The padding for an extended [M3EExtendedFloatingActionButton]'s content.
  ///
  /// If null, [FloatingActionButtonThemeData.extendedPadding] is used. If that
  /// is also null, the default is
  /// `EdgeInsetsDirectional.only(start: 16.0, end: 20.0)` if an icon is
  /// provided, and `EdgeInsetsDirectional.only(start: 20.0, end: 20.0)` if not.
  final EdgeInsetsGeometry? padding;

  /// The text style for an extended [M3EExtendedFloatingActionButton]'s label.
  ///
  /// If null, [FloatingActionButtonThemeData.extendedTextStyle] is used. If
  /// that is also null, then [TextTheme.labelLarge] with a letter spacing of 1.2
  /// is used.
  final TextStyle? textStyle;

  /// {@macro material_expressive.fab.child}
  final Widget? icon;

  final Widget label;

  /// {@macro material_expressive.fab.enable_feedback}
  final bool? enableFeedback;

  final M3EFloatingActionButtonType floatingActionButtonType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final floatingActionButtonTheme = theme.floatingActionButtonTheme;
    final m3eFabTheme = theme.extension<M3ETheme>()?.floatingActionButtonTheme;
    final defaults = _ExtendedFABDefaultsM3E(context, floatingActionButtonType);

    final foregroundColor =
        this.foregroundColor ??
        floatingActionButtonTheme.foregroundColor ??
        defaults.foregroundColor;
    final backgroundColor =
        this.backgroundColor ??
        floatingActionButtonTheme.backgroundColor ??
        defaults.backgroundColor;
    final focusColor =
        this.focusColor ??
        floatingActionButtonTheme.focusColor ??
        defaults.focusColor;
    final hoverColor =
        this.hoverColor ??
        floatingActionButtonTheme.hoverColor ??
        defaults.hoverColor;
    final splashColor =
        this.splashColor ??
        floatingActionButtonTheme.splashColor ??
        defaults.splashColor;
    final elevation =
        this.elevation ??
        floatingActionButtonTheme.elevation ??
        defaults.elevation!;
    final focusElevation =
        this.focusElevation ??
        floatingActionButtonTheme.focusElevation ??
        defaults.focusElevation!;
    final hoverElevation =
        this.hoverElevation ??
        floatingActionButtonTheme.hoverElevation ??
        defaults.hoverElevation!;
    final disabledElevation =
        this.disabledElevation ??
        floatingActionButtonTheme.disabledElevation ??
        defaults.disabledElevation ??
        elevation;
    final highlightElevation =
        this.highlightElevation ??
        floatingActionButtonTheme.highlightElevation ??
        defaults.highlightElevation!;
    final materialTapTargetSize =
        this.materialTapTargetSize ?? theme.materialTapTargetSize;
    final enableFeedback =
        this.enableFeedback ??
        floatingActionButtonTheme.enableFeedback ??
        defaults.enableFeedback!;
    final iconSize = floatingActionButtonTheme.iconSize ?? defaults.iconSize;
    final extendedTextStyle = (textStyle ??
            floatingActionButtonTheme.extendedTextStyle ??
            defaults.extendedTextStyle!)
        .copyWith(color: foregroundColor);
    final shape =
        this.shape ?? floatingActionButtonTheme.shape ?? defaults.shape;

    final iconLabelSpacing =
        this.iconLabelSpacing ??
        floatingActionButtonTheme.extendedIconLabelSpacing ??
        defaults.extendedIconLabelSpacing;
    final padding =
        this.padding ??
        floatingActionButtonTheme.extendedPadding ??
        defaults.extendedPadding;

    final resolvedChild = _ChildOverflowBox(
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: iconLabelSpacing,
          children: [
            if (icon case final child?)
              IconTheme.merge(
                data: IconThemeData(size: iconSize),
                child: child,
              ),
            label,
          ],
        ),
      ),
    );

    final sizeConstraints = switch (floatingActionButtonType) {
      M3EFloatingActionButtonType.small =>
        m3eFabTheme?.extendedSmallSizeConstraints ??
            defaults.extendedSmallSizeConstraints,
      M3EFloatingActionButtonType.medium =>
        m3eFabTheme?.extendedMediumSizeConstraints ??
            defaults.extendedMediumSizeConstraints,
      M3EFloatingActionButtonType.large =>
        m3eFabTheme?.extendedLargeSizeConstraints ??
            defaults.extendedLargeSizeConstraints,
    };

    Widget result = RawMaterialButton(
      onPressed: onPressed,
      mouseCursor: _EffectiveMouseCursor(
        mouseCursor,
        floatingActionButtonTheme.mouseCursor,
      ),
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      constraints: sizeConstraints,
      materialTapTargetSize: materialTapTargetSize,
      fillColor: backgroundColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      textStyle: extendedTextStyle,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      enableFeedback: enableFeedback,
      child: resolvedChild,
    );

    if (tooltip case final tooltip?) {
      result = Tooltip(message: tooltip, child: result);
    }
    if (heroTag case final heroTag?) {
      result = Hero(tag: heroTag, child: result);
    }

    return MergeSemantics(child: result);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<VoidCallback>(
        'onPressed',
        onPressed,
        ifNull: 'disabled',
      ),
    );
    properties.add(StringProperty('tooltip', tooltip, defaultValue: null));
    properties.add(
      ColorProperty('foregroundColor', foregroundColor, defaultValue: null),
    );
    properties.add(
      ColorProperty('backgroundColor', backgroundColor, defaultValue: null),
    );
    properties.add(ColorProperty('focusColor', focusColor, defaultValue: null));
    properties.add(ColorProperty('hoverColor', hoverColor, defaultValue: null));
    properties.add(
      ColorProperty('splashColor', splashColor, defaultValue: null),
    );
    properties.add(
      ObjectFlagProperty<Object>('heroTag', heroTag, ifPresent: 'hero'),
    );
    properties.add(DoubleProperty('elevation', elevation, defaultValue: null));
    properties.add(
      DoubleProperty('focusElevation', focusElevation, defaultValue: null),
    );
    properties.add(
      DoubleProperty('hoverElevation', hoverElevation, defaultValue: null),
    );
    properties.add(
      DoubleProperty(
        'highlightElevation',
        highlightElevation,
        defaultValue: null,
      ),
    );
    properties.add(
      DoubleProperty(
        'disabledElevation',
        disabledElevation,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<FocusNode>(
        'focusNode',
        focusNode,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<MaterialTapTargetSize>(
        'materialTapTargetSize',
        materialTapTargetSize,
        defaultValue: null,
      ),
    );
  }
}

// This MaterialStateProperty is passed along to RawMaterialButton which
// resolves the property against MaterialState.pressed, MaterialState.hovered,
// MaterialState.focused, MaterialState.disabled.
class _EffectiveMouseCursor extends WidgetStateMouseCursor {
  const _EffectiveMouseCursor(this.widgetCursor, this.themeCursor);

  final MouseCursor? widgetCursor;
  final WidgetStateProperty<MouseCursor?>? themeCursor;

  @override
  MouseCursor resolve(Set<WidgetState> states) {
    return WidgetStateProperty.resolveAs<MouseCursor?>(widgetCursor, states) ??
        themeCursor?.resolve(states) ??
        WidgetStateMouseCursor.clickable.resolve(states);
  }

  @override
  String get debugDescription => 'MaterialStateMouseCursor(FloatActionButton)';
}

// This widget's size matches its child's size unless its constraints
// force it to be larger or smaller. The child is centered.
//
// Used to encapsulate extended FABs whose size is fixed, using Row
// and MainAxisSize.min, to be as wide as their label and icon.
class _ChildOverflowBox extends SingleChildRenderObjectWidget {
  const _ChildOverflowBox({super.child});

  @override
  _RenderChildOverflowBox createRenderObject(BuildContext context) {
    return _RenderChildOverflowBox(textDirection: Directionality.of(context));
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderChildOverflowBox renderObject,
  ) {
    renderObject.textDirection = Directionality.of(context);
  }
}

class _RenderChildOverflowBox extends RenderAligningShiftedBox {
  _RenderChildOverflowBox({super.textDirection})
    : super(alignment: Alignment.center);

  @override
  double computeMinIntrinsicWidth(double height) => 0.0;

  @override
  double computeMinIntrinsicHeight(double width) => 0.0;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    if (child != null) {
      final Size childSize = child!.getDryLayout(const BoxConstraints());
      return Size(
        math.max(
          constraints.minWidth,
          math.min(constraints.maxWidth, childSize.width),
        ),
        math.max(
          constraints.minHeight,
          math.min(constraints.maxHeight, childSize.height),
        ),
      );
    } else {
      return constraints.biggest;
    }
  }

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    if (child != null) {
      child!.layout(const BoxConstraints(), parentUsesSize: true);
      size = Size(
        math.max(
          constraints.minWidth,
          math.min(constraints.maxWidth, child!.size.width),
        ),
        math.max(
          constraints.minHeight,
          math.min(constraints.maxHeight, child!.size.height),
        ),
      );
      alignChild();
    } else {
      size = constraints.biggest;
    }
  }
}

class _ExtendedFABDefaultsM3E extends FloatingActionButtonThemeData {
  _ExtendedFABDefaultsM3E(this.context, this.type)
    : extendedSmallSizeConstraints = const BoxConstraints.tightFor(height: 56),
      extendedMediumSizeConstraints = const BoxConstraints.tightFor(height: 80),
      extendedLargeSizeConstraints = const BoxConstraints.tightFor(height: 96),
      super(
        elevation: 6.0,
        focusElevation: 6.0,
        hoverElevation: 8.0,
        highlightElevation: 6.0,
        enableFeedback: true,
      );

  final BuildContext context;
  final M3EFloatingActionButtonType type;
  final BoxConstraints extendedSmallSizeConstraints;
  final BoxConstraints extendedMediumSizeConstraints;
  final BoxConstraints extendedLargeSizeConstraints;
  late final ColorScheme _colors = Theme.of(context).colorScheme;
  late final TextTheme _textTheme = Theme.of(context).textTheme;

  @override
  Color get foregroundColor => _colors.onPrimaryContainer;

  @override
  Color get backgroundColor => _colors.primaryContainer;

  @override
  Color get splashColor => _colors.onPrimaryContainer.withValues(alpha: .1);

  @override
  Color get focusColor => _colors.onPrimaryContainer.withValues(alpha: .1);

  @override
  Color get hoverColor => _colors.onPrimaryContainer.withValues(alpha: .08);

  @override
  ShapeBorder get shape => switch (type) {
    M3EFloatingActionButtonType.small => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    M3EFloatingActionButtonType.medium => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    M3EFloatingActionButtonType.large => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28.0)),
    ),
  };

  @override
  double get iconSize => switch (type) {
    M3EFloatingActionButtonType.small => 24.0,
    M3EFloatingActionButtonType.medium => 28.0,
    M3EFloatingActionButtonType.large => 36.0,
  };

  @override
  double get extendedIconLabelSpacing => switch (type) {
    M3EFloatingActionButtonType.small => 8.0,
    M3EFloatingActionButtonType.medium => 12.0,
    M3EFloatingActionButtonType.large => 16.0,
  };

  @override
  EdgeInsetsGeometry get extendedPadding => switch (type) {
    M3EFloatingActionButtonType.small => EdgeInsetsDirectional.symmetric(
      horizontal: 16.0,
      vertical: 16.0,
    ),
    M3EFloatingActionButtonType.medium => EdgeInsetsDirectional.symmetric(
      horizontal: 26.0,
      vertical: 26.0,
    ),
    M3EFloatingActionButtonType.large => EdgeInsetsDirectional.symmetric(
      horizontal: 28.0,
      vertical: 30.0,
    ),
  };

  @override
  TextStyle? get extendedTextStyle => switch (type) {
    M3EFloatingActionButtonType.small => _textTheme.titleMedium,
    M3EFloatingActionButtonType.medium => _textTheme.titleLarge,
    M3EFloatingActionButtonType.large => _textTheme.headlineSmall,
  };
}
