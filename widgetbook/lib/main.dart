import 'package:material_expressive/material_expressive.dart';
import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// This file does not exist yet,
// it will be generated in the next step
import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      // The [directories] variable does not exist yet,
      // it will be generated in the next step
      directories: directories,
      appBuilder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Material(child: child),
          ),
      addons: [
        ViewportAddon([
          Viewports.none,
          IosViewports.iPhone13,
          IosViewports.iPhone13ProMax,
          IosViewports.iPhoneSE,
          AndroidViewports.samsungGalaxyS20,
        ]),
        ThemeAddon<ThemeData>(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light().copyWith(extensions: [M3ETheme()]),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark().copyWith(extensions: [M3ETheme()]),
            ),
          ],
          themeBuilder:
              (context, theme, child) => Theme(
                data: theme,
                child: ColoredBox(
                  color: theme.scaffoldBackgroundColor,
                  child: DefaultTextStyle(
                    style: theme.textTheme.bodyMedium ?? const TextStyle(),
                    child: child,
                  ),
                ),
              ),
        ),
      ],
    );
  }
}
