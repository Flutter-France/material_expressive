import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_expressive/src/theme/m3e_floating_action_button_theme_data.dart';
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

    final extendedTextStyle =
        widget.textStyle ??
        floatingActionButtonTheme.extendedTextStyle ??
        defaults.extendedTextStyle;
    final iconLabelSpacing =
        widget.iconLabelSpacing ??
        floatingActionButtonTheme.extendedIconLabelSpacing ??
        defaults.extendedIconLabelSpacing;
    final padding =
        widget.padding ??
        floatingActionButtonTheme.extendedPadding ??
        defaults.extendedPadding;

    final sizeAnimationSpec = m3eTheme.motionScheme.fastSpatialSpec;
    final opacityAnimationSpec = m3eTheme.motionScheme.fastEffectsSpec;

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

    return Theme(
      data: theme.copyWith(
        floatingActionButtonTheme: floatingActionButtonTheme.copyWith(
          sizeConstraints: sizeConstraints,
          smallSizeConstraints: sizeConstraints,
          largeSizeConstraints: sizeConstraints,
          extendedIconLabelSpacing: iconLabelSpacing,
          extendedPadding: padding,
          extendedTextStyle: extendedTextStyle,
        ),
        extensions: [
          m3eTheme.copyWith(
            floatingActionButtonTheme: (m3eFabTheme ??
                    M3EFloatingActionButtonThemeData())
                .copyWith(mediumSizeConstraints: sizeConstraints),
          ),
        ],
      ),
      child: M3EFloatingActionButton(
        floatingActionButtonType: widget.floatingActionButtonType,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon case final icon?) icon,
              AnimatedSize(
                duration: sizeAnimationSpec.duration,
                curve: sizeAnimationSpec.curve,
                child:
                    showLabel
                        ? Padding(
                          padding: EdgeInsets.only(
                            left: widget.icon != null ? iconLabelSpacing : 0,
                          ),
                          child: AnimatedOpacity(
                            opacity: showLabel ? 1 : 0,
                            duration: opacityAnimationSpec.duration,
                            curve: opacityAnimationSpec.curve,
                            child: widget.label,
                          ),
                        )
                        : SizedBox.shrink(),
              ),
            ],
          ),
        ),
        tooltip: widget.tooltip,
        foregroundColor: widget.foregroundColor,
        backgroundColor: widget.backgroundColor,
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        splashColor: widget.splashColor,
        heroTag: widget.heroTag,
        elevation: widget.elevation,
        focusElevation: widget.focusElevation,
        hoverElevation: widget.hoverElevation,
        highlightElevation: widget.highlightElevation,
        disabledElevation: widget.disabledElevation,
        onPressed: widget.onPressed,
        mouseCursor: widget.mouseCursor,
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        materialTapTargetSize: widget.materialTapTargetSize,
        enableFeedback: widget.enableFeedback,
        isExtended: true,
      ),
    );
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
      );

  final BuildContext context;
  final M3EFloatingActionButtonType type;
  final BoxConstraints extendedSmallSizeConstraints;
  final BoxConstraints extendedMediumSizeConstraints;
  final BoxConstraints extendedLargeSizeConstraints;
  late final TextTheme _textTheme = Theme.of(context).textTheme;

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
