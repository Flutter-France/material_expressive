import 'package:material_ui/material_ui.dart';
import 'package:material_expressive/material_expressive.dart';
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
      appBuilder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(extensions: [M3ETheme()]),
          darkTheme: ThemeData.dark().copyWith(extensions: [M3ETheme()]),
          home: Material(child: child),
        );
      },
    );
  }
}
