import 'package:flutter/material.dart';
import 'package:material_expressive/material_expressive.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'FAB Menu', type: M3EFloatingActionButtonMenu)
Widget buildFloatingActionButtonMenu(BuildContext context) {
  final size = context.knobs.list<M3EFloatingActionButtonType>(
    label: 'FAB Size',
    options: M3EFloatingActionButtonType.values,
    labelBuilder: (s) => s.name,
  );

  final expanded = context.knobs.boolean(
    label: 'Expanded',
    initialValue: false,
  );

  return M3EFloatingActionButtonMenu(
    expanded: expanded,
    onClosePressed: () {},
    button: M3EFloatingActionButton(
      onPressed: () {},
      floatingActionButtonType: size,
      child: Icon(Icons.add),
    ),
    items: [
      M3EFloatingActionButtonMenuItem(
        label: 'First',
        icon: Icon(Icons.star),
        onPressed: () {},
      ),
    ],
  );
}
