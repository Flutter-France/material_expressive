import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:material_ui/material_ui.dart';
import 'package:motor/motor.dart';

enum ButtonGroupMode { standard, connected }

enum ButtonSize { xSmall, small, medium, large, xLarge }

/// Fraction of its own width a pressed button grows by (Compose default).
const _expandedRatio = 0.15;

/// Gap between buttons of a [ButtonGroupMode.connected] group, for all sizes.
const _connectedSpacing = 2.0;

const _spatialMotion = MaterialSpringMotion.expressiveSpatialFast();
const _effectsMotion = MaterialSpringMotion.expressiveEffectsFast();

typedef _Tokens = ({
  double height,
  double padding,
  double iconSize,
  double iconGap,
  double squareRadius,
  double pressedRadius,
  double spacing,
  double innerRadius,
  double innerPressedRadius,
});

// shortcut: values from the M3 Expressive button / button group kit; only the
// small size is verified against Compose tokens. Re-check if the spec changes.
_Tokens _tokensFor(ButtonSize size) => switch (size) {
  .xSmall => (
    height: 32,
    padding: 12,
    iconSize: 20,
    iconGap: 4,
    squareRadius: 12,
    pressedRadius: 8,
    spacing: 18,
    innerRadius: 4,
    innerPressedRadius: 2,
  ),
  .small => (
    height: 40,
    padding: 16,
    iconSize: 20,
    iconGap: 8,
    squareRadius: 12,
    pressedRadius: 8,
    spacing: 12,
    innerRadius: 8,
    innerPressedRadius: 4,
  ),
  .medium => (
    height: 56,
    padding: 24,
    iconSize: 24,
    iconGap: 8,
    squareRadius: 16,
    pressedRadius: 12,
    spacing: 8,
    innerRadius: 8,
    innerPressedRadius: 4,
  ),
  .large => (
    height: 96,
    padding: 48,
    iconSize: 32,
    iconGap: 12,
    squareRadius: 28,
    pressedRadius: 16,
    spacing: 8,
    innerRadius: 16,
    innerPressedRadius: 12,
  ),
  .xLarge => (
    height: 136,
    padding: 64,
    iconSize: 40,
    iconGap: 16,
    squareRadius: 28,
    pressedRadius: 16,
    spacing: 8,
    innerRadius: 20,
    innerPressedRadius: 16,
  ),
};

TextStyle? _labelStyleFor(ButtonSize size, TextTheme textTheme) =>
    switch (size) {
      .xSmall || .small => textTheme.labelLarge,
      .medium => textTheme.titleMedium,
      .large => textTheme.headlineSmall,
      .xLarge => textTheme.headlineLarge,
    };

final _borderRadiusConverter = MotionConverter<BorderRadius>.custom(
  normalize: (r) => [
    r.topLeft.x,
    r.topRight.x,
    r.bottomLeft.x,
    r.bottomRight.x,
  ],
  // Springs can overshoot below zero.
  denormalize: (v) => BorderRadius.only(
    topLeft: Radius.circular(math.max(0, v[0])),
    topRight: Radius.circular(math.max(0, v[1])),
    bottomLeft: Radius.circular(math.max(0, v[2])),
    bottomRight: Radius.circular(math.max(0, v[3])),
  ),
);

/// Material 3 Expressive button group.
///
/// * [ButtonGroupMode.standard]: spaced buttons, round when unselected,
///   square when selected.
/// * [ButtonGroupMode.connected]: tightly packed buttons with round outer
///   corners, becoming fully round when selected.
///
/// In both modes the pressed button grows and its neighbours shrink.
class M3EButtonGroup<T> extends StatefulWidget {
  const M3EButtonGroup({
    required this.items,
    this.selected = const {},
    this.onSelectionChanged,
    this.multiSelectionEnabled = false,
    this.emptySelectionAllowed = false,
    this.showSelectedIcon = true,
    this.mode = ButtonGroupMode.standard,
    this.size = ButtonSize.medium,
    super.key,
  }) : assert(items.length > 0),
       assert(
         selected.length > 0 ||
             emptySelectionAllowed ||
             onSelectionChanged == null,
       ),
       assert(selected.length < 2 || multiSelectionEnabled);

  final List<ButtonGroupItem<T>> items;

  /// Values of the selected [items].
  final Set<T> selected;

  /// Called with the new selection when an item is toggled.
  ///
  /// When null, items act as plain buttons (see [ButtonGroupItem.onPressed]).
  final ValueChanged<Set<T>>? onSelectionChanged;
  final bool multiSelectionEnabled;
  final bool emptySelectionAllowed;
  final bool showSelectedIcon;
  final ButtonGroupMode mode;
  final ButtonSize size;

  @override
  State<M3EButtonGroup<T>> createState() => _M3EButtonGroupState<T>();
}

class _M3EButtonGroupState<T> extends State<M3EButtonGroup<T>> {
  int? _pressedIndex;

  bool _isEnabled(ButtonGroupItem<T> item) =>
      item.enabled &&
      (item.onPressed != null || widget.onSelectionChanged != null);

  void _handleOnPressed(ButtonGroupItem<T> item) {
    item.onPressed?.call();

    final onSelectionChanged = widget.onSelectionChanged;
    if (onSelectionChanged == null) return;

    final value = item.value;
    final wasSelected = widget.selected.contains(value);
    final Set<T> next;
    if (widget.multiSelectionEnabled) {
      next = wasSelected
          ? (widget.selected.toSet()..remove(value))
          : {...widget.selected, value};
    } else {
      next = wasSelected ? <T>{} : {value};
    }
    if (next.isEmpty && !widget.emptySelectionAllowed) return;
    onSelectionChanged(next);
  }

  void _handleHighlightChanged(int index, bool pressed) {
    setState(() {
      if (pressed) {
        _pressedIndex = index;
      } else if (_pressedIndex == index) {
        _pressedIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textDirection = Directionality.of(context);
    final tokens = _tokensFor(widget.size);
    final labelStyle = _labelStyleFor(widget.size, theme.textTheme);
    final connected = widget.mode == ButtonGroupMode.connected;
    final items = widget.items;
    final last = items.length - 1;
    final pressedIndex = _pressedIndex;
    final fullRadius = Radius.circular(tokens.height / 2);
    final minTapHeight =
        theme.materialTapTargetSize == MaterialTapTargetSize.padded
        ? kMinInteractiveDimension
        : 0.0;
    final selectable = widget.onSelectionChanged != null;

    // shortcut: neighbours shrink relative to their own width, so the group
    // width is only preserved for equal-width items. Measure siblings in a
    // custom multi-child layout if unequal widths make the group jitter.
    double widthFactor(int i) {
      if (pressedIndex == null) return 1;
      if (i == pressedIndex) return 1 + _expandedRatio;
      if ((i - pressedIndex).abs() != 1) return 1;
      final pressedIsEdge = pressedIndex == 0 || pressedIndex == last;
      return 1 - (pressedIsEdge ? _expandedRatio : _expandedRatio / 2);
    }

    BorderRadius radiusFor(
      int i, {
      required bool selected,
      required bool pressed,
    }) {
      if (!connected) {
        return BorderRadius.circular(
          pressed
              ? tokens.pressedRadius
              : selected
              ? tokens.squareRadius
              : fullRadius.x,
        );
      }
      if (selected && !pressed) return BorderRadius.all(fullRadius);
      final inner = Radius.circular(
        pressed ? tokens.innerPressedRadius : tokens.innerRadius,
      );
      return BorderRadiusDirectional.horizontal(
        start: i == 0 ? fullRadius : inner,
        end: i == last ? fullRadius : inner,
      ).resolve(textDirection);
    }

    Widget buttonFor(int i) {
      final item = items[i];
      final itemSelected = widget.selected.contains(item.value);
      final enabled = _isEnabled(item);
      final onTap = enabled ? () => _handleOnPressed(item) : null;

      final Color background;
      final Color foreground;
      if (!enabled) {
        background = colors.onSurface.withValues(alpha: 0.1);
        foreground = colors.onSurface.withValues(alpha: 0.38);
      } else if (itemSelected) {
        background = colors.primary;
        foreground = colors.onPrimary;
      } else {
        background = colors.surfaceContainer;
        foreground = colors.onSurfaceVariant;
      }

      final label = item.label ?? item.icon ?? const SizedBox.shrink();
      final icon = (itemSelected && widget.showSelectedIcon)
          ? const Icon(Icons.check)
          : item.label != null
          ? item.icon
          : null;

      final content = IconTheme.merge(
        data: IconThemeData(color: foreground, size: tokens.iconSize),
        child: DefaultTextStyle.merge(
          style: labelStyle?.copyWith(color: foreground),
          maxLines: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: tokens.padding),
            child: Row(
              mainAxisSize: .min,
              spacing: tokens.iconGap,
              children: [?icon, label],
            ),
          ),
        ),
      );

      Widget button = MotionBuilder<Color>(
        value: background,
        motion: _effectsMotion,
        converter: MotionConverter.colorRgb,
        builder: (context, color, child) => MotionBuilder<BorderRadius>(
          value: radiusFor(
            i,
            selected: itemSelected,
            pressed: i == pressedIndex,
          ),
          motion: _spatialMotion,
          converter: _borderRadiusConverter,
          builder: (context, radius, child) => Material(
            color: color,
            shape: RoundedRectangleBorder(borderRadius: radius),
            clipBehavior: .antiAlias,
            animationDuration: .zero,
            child: child,
          ),
          child: child,
        ),
        child: InkWell(
          onTap: onTap,
          onHighlightChanged: (pressed) => _handleHighlightChanged(i, pressed),
          // Neighbours shrink into their padding; never paint overflow.
          child: OverflowBox(maxWidth: double.infinity, child: content),
        ),
      );

      button = SizedBox(
        height: tokens.height,
        child: SingleMotionBuilder(
          value: widthFactor(i),
          motion: _spatialMotion,
          builder: (context, factor, child) =>
              _WidthFactor(factor: factor, child: child!),
          child: button,
        ),
      );

      // Extend the hit area of small sizes to the minimum touch target. The
      // InkWell is deeper in the tree, so it wins taps on the visible button.
      if (minTapHeight > tokens.height) {
        button = GestureDetector(
          behavior: .opaque,
          onTap: onTap,
          excludeFromSemantics: true,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: (minTapHeight - tokens.height) / 2,
            ),
            child: button,
          ),
        );
      }

      if (item.tooltip case final tooltip?) {
        button = Tooltip(message: tooltip, child: button);
      }

      return MergeSemantics(
        child: Semantics(
          selected: selectable ? itemSelected : null,
          inMutuallyExclusiveGroup: selectable && !widget.multiSelectionEnabled
              ? true
              : null,
          child: button,
        ),
      );
    }

    return Row(
      mainAxisSize: .min,
      spacing: connected ? _connectedSpacing : tokens.spacing,
      children: [for (var i = 0; i < items.length; i++) buttonFor(i)],
    );
  }
}

class ButtonGroupItem<T> {
  const ButtonGroupItem({
    required this.value,
    this.icon,
    this.label,
    this.tooltip,
    this.onPressed,
    this.enabled = true,
  }) : assert(
         label != null || icon != null,
         'Either label or icon must be provided',
       );

  /// Value used to identify the button within the group.
  ///
  /// This value must be unique within the group in an [M3EButtonGroup].
  final T value;

  /// Optional icon displayed on the button.
  final Widget? icon;

  /// Optional label displayed on the button.
  final Widget? label;

  /// Optional tooltip for the button.
  final String? tooltip;

  /// Called when the button is tapped, before any selection change.
  final VoidCallback? onPressed;

  /// Whether the button can be interacted with.
  final bool enabled;
}

/// Sizes its child to [factor] times the child's natural width.
class _WidthFactor extends SingleChildRenderObjectWidget {
  const _WidthFactor({required this.factor, required super.child});

  final double factor;

  @override
  _RenderWidthFactor createRenderObject(BuildContext context) =>
      _RenderWidthFactor(factor);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderWidthFactor renderObject,
  ) => renderObject.factor = factor;
}

class _RenderWidthFactor extends RenderProxyBox {
  _RenderWidthFactor(this._factor);

  double _factor;
  set factor(double value) {
    if (value == _factor) return;
    _factor = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) =>
      super.computeMaxIntrinsicWidth(height) * _factor;

  @override
  double computeMaxIntrinsicWidth(double height) =>
      super.computeMaxIntrinsicWidth(height) * _factor;

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      constraints.constrain(Size(_width(constraints), constraints.maxHeight));

  double _width(BoxConstraints constraints) => constraints.constrainWidth(
    child!.getMaxIntrinsicWidth(constraints.maxHeight) * _factor,
  );

  @override
  void performLayout() {
    child!.layout(
      constraints.tighten(width: _width(constraints)),
      parentUsesSize: true,
    );
    size = child!.size;
  }
}
