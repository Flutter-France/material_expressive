import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_expressive/src/theme/m3e_theme.dart';
import 'package:material_expressive/src/utils/debug_check_has_expressive_material.dart';

import 'm3e_floating_action_button.dart';

class _DefaultHeroTag {
  const _DefaultHeroTag();

  @override
  String toString() => '<default M3EExtendedFloatingActionButton tag>';
}

class M3EExtendedFloatingActionButton extends StatefulWidget {
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
    this.scrollController,
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
    this.scrollController,
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
    this.scrollController,
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
    this.scrollController,
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

  /// If specified, the label will be hidden when scrolling down, and shown
  /// when scrolling up.
  final ScrollController? scrollController;

  final M3EFloatingActionButtonType floatingActionButtonType;

  @override
  State<M3EExtendedFloatingActionButton> createState() =>
      _M3EExtendedFloatingActionButtonState();
}

class _M3EExtendedFloatingActionButtonState
    extends State<M3EExtendedFloatingActionButton>
    with TickerProviderStateMixin {
  bool showLabel = true;

  void scrollControllerListener() {
    if (widget.scrollController case final controller?) {
      if (!controller.hasClients) return;

      final position = controller.position;
      final isScrollingDown =
          position.userScrollDirection == ScrollDirection.reverse;
      if (isScrollingDown && showLabel) {
        setState(() => showLabel = false);
      } else if (!isScrollingDown && !showLabel) {
        setState(() => showLabel = true);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(scrollControllerListener);
  }

  @override
  void didUpdateWidget(M3EExtendedFloatingActionButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.scrollController != oldWidget.scrollController) {
      oldWidget.scrollController?.removeListener(scrollControllerListener);
      widget.scrollController?.addListener(scrollControllerListener);
    }
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(scrollControllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasExpressiveMaterial(context));

    final theme = Theme.of(context);
    final floatingActionButtonTheme = theme.floatingActionButtonTheme;
    final m3eTheme = M3ETheme.of(context);
    final m3eFabTheme = m3eTheme.floatingActionButtonTheme;
    final defaults = _ExtendedFABDefaultsM3E(
      context,
      widget.floatingActionButtonType,
    );

    final foregroundColor =
        widget.foregroundColor ??
        floatingActionButtonTheme.foregroundColor ??
        defaults.foregroundColor;
    final backgroundColor =
        widget.backgroundColor ??
        floatingActionButtonTheme.backgroundColor ??
        defaults.backgroundColor;
    final focusColor =
        widget.focusColor ??
        floatingActionButtonTheme.focusColor ??
        defaults.focusColor;
    final hoverColor =
        widget.hoverColor ??
        floatingActionButtonTheme.hoverColor ??
        defaults.hoverColor;
    final splashColor =
        widget.splashColor ??
        floatingActionButtonTheme.splashColor ??
        defaults.splashColor;
    final elevation =
        widget.elevation ??
        floatingActionButtonTheme.elevation ??
        defaults.elevation!;
    final focusElevation =
        widget.focusElevation ??
        floatingActionButtonTheme.focusElevation ??
        defaults.focusElevation!;
    final hoverElevation =
        widget.hoverElevation ??
        floatingActionButtonTheme.hoverElevation ??
        defaults.hoverElevation!;
    final disabledElevation =
        widget.disabledElevation ??
        floatingActionButtonTheme.disabledElevation ??
        defaults.disabledElevation ??
        elevation;
    final highlightElevation =
        widget.highlightElevation ??
        floatingActionButtonTheme.highlightElevation ??
        defaults.highlightElevation!;
    final materialTapTargetSize =
        widget.materialTapTargetSize ?? theme.materialTapTargetSize;
    final enableFeedback =
        widget.enableFeedback ??
        floatingActionButtonTheme.enableFeedback ??
        defaults.enableFeedback!;
    final iconSize = floatingActionButtonTheme.iconSize ?? defaults.iconSize;
    final extendedTextStyle = (widget.textStyle ??
            floatingActionButtonTheme.extendedTextStyle ??
            defaults.extendedTextStyle!)
        .copyWith(color: foregroundColor);
    final shape =
        widget.shape ?? floatingActionButtonTheme.shape ?? defaults.shape;

    final iconLabelSpacing =
        widget.iconLabelSpacing ??
        floatingActionButtonTheme.extendedIconLabelSpacing ??
        defaults.extendedIconLabelSpacing;
    final padding =
        widget.padding ??
        floatingActionButtonTheme.extendedPadding ??
        defaults.extendedPadding;

    final labelSpec = m3eTheme.motionScheme.defaultEffectsSpec;

    final resolvedChild = _ChildOverflowBox(
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon case final child?)
              IconTheme.merge(
                data: IconThemeData(size: iconSize),
                child: child,
              ),
            AnimatedSize(
              duration: labelSpec.duration,
              curve: labelSpec.curve,
              child:
                  showLabel
                      ? Padding(
                        padding: EdgeInsets.only(left: iconLabelSpacing),
                        child: widget.label,
                      )
                      : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );

    final sizeConstraints = switch (widget.floatingActionButtonType) {
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
      onPressed: widget.onPressed,
      mouseCursor: _EffectiveMouseCursor(
        widget.mouseCursor,
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
      clipBehavior: widget.clipBehavior,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      enableFeedback: enableFeedback,
      child: resolvedChild,
    );

    if (widget.tooltip case final tooltip?) {
      result = Tooltip(message: tooltip, child: result);
    }
    if (widget.heroTag case final heroTag?) {
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
        widget.onPressed,
        ifNull: 'disabled',
      ),
    );
    properties.add(
      StringProperty('tooltip', widget.tooltip, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        'foregroundColor',
        widget.foregroundColor,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        'backgroundColor',
        widget.backgroundColor,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty('focusColor', widget.focusColor, defaultValue: null),
    );
    properties.add(
      ColorProperty('hoverColor', widget.hoverColor, defaultValue: null),
    );
    properties.add(
      ColorProperty('splashColor', widget.splashColor, defaultValue: null),
    );
    properties.add(
      ObjectFlagProperty<Object>('heroTag', widget.heroTag, ifPresent: 'hero'),
    );
    properties.add(
      DoubleProperty('elevation', widget.elevation, defaultValue: null),
    );
    properties.add(
      DoubleProperty(
        'focusElevation',
        widget.focusElevation,
        defaultValue: null,
      ),
    );
    properties.add(
      DoubleProperty(
        'hoverElevation',
        widget.hoverElevation,
        defaultValue: null,
      ),
    );
    properties.add(
      DoubleProperty(
        'highlightElevation',
        widget.highlightElevation,
        defaultValue: null,
      ),
    );
    properties.add(
      DoubleProperty(
        'disabledElevation',
        widget.disabledElevation,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<ShapeBorder>(
        'shape',
        widget.shape,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<FocusNode>(
        'focusNode',
        widget.focusNode,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<MaterialTapTargetSize>(
        'materialTapTargetSize',
        widget.materialTapTargetSize,
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
    : extendedSmallSizeConstraints = const BoxConstraints(
        minHeight: 56,
        maxHeight: 56,
        minWidth: 56,
      ),
      extendedMediumSizeConstraints = const BoxConstraints(
        minHeight: 80,
        maxHeight: 80,
        minWidth: 80,
      ),
      extendedLargeSizeConstraints = const BoxConstraints(
        minHeight: 96,
        maxHeight: 96,
        minWidth: 96,
      ),
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
