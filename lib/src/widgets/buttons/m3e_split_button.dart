import 'package:flutter/material.dart';
import 'package:material_expressive/material_expressive.dart';
import 'package:material_expressive/src/theme/m3e_split_button_theme_data.dart';
import 'package:material_expressive/src/utils/debug_check_has_expressive_material.dart';

/// A [M3ESplitButton] lets a user define a button group consisting of 2 buttons.
/// The leading button performs a primary action, and the trailing button performs
/// a secondary action that is contextually related to the primary action.
class M3ESplitButton extends StatelessWidget {
  const M3ESplitButton({
    super.key,
    required this.leading,
    required this.trailing,
    this.spacing,
  });

  /// A [Widget] representing the leading button in a split button group.
  final Widget leading;

  /// A [Widget] representing the trailing button in a split button group.
  final Widget trailing;

  /// The horizontal spacing between the leading and trailing buttons.
  ///
  /// If this property is null, then the [M3ESplitButtonThemeData.spacing]
  /// of [ThemeData.splitButtonTheme] is used. If that property is also
  /// null, then the default spacing value (2.0) is used.
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    debugCheckHasExpressiveMaterial(context);

    final M3ESplitButtonThemeData? theme =
        Theme.of(context).extension<M3ETheme>()?.splitButtonTheme;
    final effectiveSpacing =
        spacing ?? theme?.spacing ?? _M3ESplitButtonDefaults.spacing;

    return Row(
      children: [leading, SizedBox(width: effectiveSpacing), trailing],
    );
  }
}

/// Default values for [M3ESplitButton]
class _M3ESplitButtonDefaults {
  static const spacing = 2.0;
}
