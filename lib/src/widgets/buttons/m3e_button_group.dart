import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:material_ui/material_ui.dart';
import 'package:material_expressive/src/theme/animation_spec.dart';
import 'package:material_expressive/src/utils/spring_builder.dart';

enum ButtonGroupMode { standard, connected }

enum ButtonSize { xSmall, small, medium, large, xLarge }

/// Gap between buttons of a [ButtonGroupMode.connected] group, for all sizes.
const _connectedSpacing = 2.0;

const _spatialMotion = SpringSpec.expressiveSpatialFast;
const _effectsMotion = SpringSpec.expressiveEffectsFast;

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
  double connectedMinWidth,
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
    connectedMinWidth: 48,
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
    connectedMinWidth: 48,
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
    connectedMinWidth: 0,
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
    connectedMinWidth: 0,
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
    connectedMinWidth: 0,
  ),
};

TextStyle? _labelStyleFor(ButtonSize size, TextTheme textTheme) =>
    switch (size) {
      .xSmall || .small => textTheme.labelLarge,
      .medium => textTheme.titleMedium,
      .large => textTheme.headlineSmall,
      .xLarge => textTheme.headlineLarge,
    };

/// Material 3 Expressive button group.
///
/// * [ButtonGroupMode.standard]: spaced buttons, round when unselected,
///   square when selected.
/// * [ButtonGroupMode.connected]: tightly packed buttons with round outer
///   corners, becoming fully round when selected.
///
/// In standard mode the pressed button grows and its neighbours shrink, each
/// by at most its horizontal padding. Connected buttons never change width.
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
    this.expandedRatio = 0.15,
    super.key,
  }) : assert(items.length > 0),
       assert(expandedRatio >= 0),
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

  /// Fraction of its own width a pressed button grows by in
  /// [ButtonGroupMode.standard]; neighbours shrink by the same total.
  /// 0 disables the effect, 1 doubles the pressed button.
  final double expandedRatio;

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

      Widget button = SpringBuilder<Color>(
        value: background,
        spring: _effectsMotion,
        converter: colorSpringConverter,
        builder: (context, color, child) => SpringBuilder<BorderRadius>(
          value: radiusFor(
            i,
            selected: itemSelected,
            pressed: i == pressedIndex,
          ),
          spring: _spatialMotion,
          converter: borderRadiusSpringConverter,
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
          // Counts as the natural width, so presses scale from at least this.
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: connected ? tokens.connectedMinWidth : 0,
            ),
            // Neighbours shrink into their padding; never paint overflow.
            child: OverflowBox(maxWidth: double.infinity, child: content),
          ),
        ),
      );

      button = SizedBox(height: tokens.height, child: button);

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

      return SpringBuilder<double>(
        value: !connected && i == pressedIndex ? 1.0 : 0.0,
        spring: _spatialMotion,
        converter: doubleSpringConverter,
        builder: (context, progress, child) =>
            _GroupItem(pressProgress: progress, child: child!),
        child: MergeSemantics(
          child: Semantics(
            button: true,
            enabled: enabled,
            checked: selectable ? itemSelected : null,
            inMutuallyExclusiveGroup:
                selectable && !widget.multiSelectionEnabled ? true : null,
            child: button,
          ),
        ),
      );
    }

    return _GroupLayout(
      spacing: connected ? _connectedSpacing : tokens.spacing,
      expandedRatio: widget.expandedRatio,
      compressionLimit: tokens.padding,
      textDirection: textDirection,
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

class _GroupParentData extends ContainerBoxParentData<RenderBox> {
  /// 0 at rest, 1 fully pressed; springs may overshoot.
  double pressProgress = 0;
}

class _GroupItem extends ParentDataWidget<_GroupParentData> {
  const _GroupItem({required this.pressProgress, required super.child});

  final double pressProgress;

  @override
  void applyParentData(RenderObject renderObject) {
    final data = renderObject.parentData! as _GroupParentData;
    if (data.pressProgress == pressProgress) return;
    data.pressProgress = pressProgress;
    renderObject.parent?.markNeedsLayout();
  }

  @override
  Type get debugTypicalAncestorWidgetClass => _GroupLayout;
}

/// Lays buttons out in a row. A pressed button grows by [expandedRatio] of
/// its natural width and takes that width from its neighbours (all of it from
/// the single neighbour of an edge button, half from each otherwise), so the
/// group keeps its width. A neighbour gives at most [compressionLimit]; past
/// that the group grows, as in Compose.
class _GroupLayout extends MultiChildRenderObjectWidget {
  const _GroupLayout({
    required this.spacing,
    required this.expandedRatio,
    required this.compressionLimit,
    required this.textDirection,
    required super.children,
  });

  final double spacing;
  final double expandedRatio;
  final double compressionLimit;
  final TextDirection textDirection;

  @override
  _RenderGroupLayout createRenderObject(BuildContext context) =>
      _RenderGroupLayout(
        spacing: spacing,
        expandedRatio: expandedRatio,
        compressionLimit: compressionLimit,
        textDirection: textDirection,
      );

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderGroupLayout renderObject,
  ) => renderObject
    ..spacing = spacing
    ..expandedRatio = expandedRatio
    ..compressionLimit = compressionLimit
    ..textDirection = textDirection;
}

class _RenderGroupLayout extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _GroupParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _GroupParentData> {
  _RenderGroupLayout({
    required double spacing,
    required double expandedRatio,
    required double compressionLimit,
    required TextDirection textDirection,
  }) : _spacing = spacing,
       _expandedRatio = expandedRatio,
       _compressionLimit = compressionLimit,
       _textDirection = textDirection;

  double _spacing;
  set spacing(double value) {
    if (value == _spacing) return;
    _spacing = value;
    markNeedsLayout();
  }

  double _expandedRatio;
  set expandedRatio(double value) {
    if (value == _expandedRatio) return;
    _expandedRatio = value;
    markNeedsLayout();
  }

  double _compressionLimit;
  set compressionLimit(double value) {
    if (value == _compressionLimit) return;
    _compressionLimit = value;
    markNeedsLayout();
  }

  TextDirection _textDirection;
  set textDirection(TextDirection value) {
    if (value == _textDirection) return;
    _textDirection = value;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _GroupParentData) {
      child.parentData = _GroupParentData();
    }
  }

  /// Width of each child, in child order.
  List<double> _widths() {
    final children = getChildrenAsList();
    final last = children.length - 1;
    final natural = [
      for (final c in children) c.getMaxIntrinsicWidth(double.infinity),
    ];
    final expansion = [
      for (var i = 0; i <= last; i++)
        natural[i] *
            _expandedRatio *
            (children[i].parentData! as _GroupParentData).pressProgress,
    ];
    double given(int j) =>
        j == 0 || j == last ? expansion[j] : expansion[j] / 2;
    return [
      for (var i = 0; i <= last; i++)
        math.max(
          0,
          natural[i] +
              expansion[i] -
              math.min(
                _compressionLimit,
                (i > 0 ? given(i - 1) : 0) + (i < last ? given(i + 1) : 0),
              ),
        ),
    ];
  }

  double _totalWidth(List<double> widths) =>
      widths.fold(0.0, (a, b) => a + b) +
      _spacing * math.max(0, widths.length - 1);

  BoxConstraints _childConstraints(double width, BoxConstraints constraints) =>
      BoxConstraints(
        minWidth: width,
        maxWidth: width,
        maxHeight: constraints.maxHeight,
      );

  @override
  double computeMinIntrinsicWidth(double height) => _totalWidth(_widths());

  @override
  double computeMaxIntrinsicWidth(double height) => _totalWidth(_widths());

  @override
  double computeMinIntrinsicHeight(double width) =>
      _maxChild((c) => c.getMinIntrinsicHeight(double.infinity));

  @override
  double computeMaxIntrinsicHeight(double width) =>
      _maxChild((c) => c.getMaxIntrinsicHeight(double.infinity));

  double _maxChild(double Function(RenderBox) measure) =>
      getChildrenAsList().map(measure).fold(0.0, math.max);

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final widths = _widths();
    final children = getChildrenAsList();
    var height = 0.0;
    for (var i = 0; i < children.length; i++) {
      height = math.max(
        height,
        children[i]
            .getDryLayout(_childConstraints(widths[i], constraints))
            .height,
      );
    }
    return constraints.constrain(Size(_totalWidth(widths), height));
  }

  @override
  void performLayout() {
    final widths = _widths();
    final children = getChildrenAsList();
    var height = 0.0;
    for (var i = 0; i < children.length; i++) {
      children[i].layout(
        _childConstraints(widths[i], constraints),
        parentUsesSize: true,
      );
      height = math.max(height, children[i].size.height);
    }

    final ordered = _textDirection == TextDirection.rtl
        ? children.reversed
        : children;
    var x = 0.0;
    for (final child in ordered) {
      (child.parentData! as _GroupParentData).offset = Offset(
        x,
        (height - child.size.height) / 2,
      );
      x += child.size.width + _spacing;
    }
    size = constraints.constrain(Size(_totalWidth(widths), height));
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) =>
      defaultComputeDistanceToHighestActualBaseline(baseline);

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) =>
      defaultHitTestChildren(result, position: position);

  @override
  void paint(PaintingContext context, Offset offset) =>
      defaultPaint(context, offset);
}
