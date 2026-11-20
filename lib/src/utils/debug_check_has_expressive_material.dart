import 'package:material_ui/material_ui.dart';
import 'package:material_expressive/src/theme/m3e_theme.dart';

bool debugCheckHasExpressiveMaterial(BuildContext context) {
  assert(debugCheckHasMaterial(context));
  assert(() {
    final hasExpressiveTheme = Theme.of(context).extension<M3ETheme>() != null;
    if (!hasExpressiveTheme) {
      throw FlutterError.fromParts([
        ErrorSummary('No M3ETheme found within the context.'),
        ErrorDescription(
          '${context.widget.runtimeType} widgets require for the '
          'M3ETheme to be provided in the ThemeData extensions.',
        ),
        ErrorHint(
          'To fix this, ensure that your ThemeData includes M3ETheme in its '
          'theme extensions.',
        ),
        ...context.describeMissingAncestor(expectedAncestorType: M3ETheme),
      ]);
    }
    return true;
  }());
  return true;
}
