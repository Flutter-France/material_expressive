// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:material_expressive_widgetbook/buttons/button_group.dart'
    as _material_expressive_widgetbook_buttons_button_group;
import 'package:material_expressive_widgetbook/buttons/floating_action_button.dart'
    as _material_expressive_widgetbook_buttons_floating_action_button;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'buttons',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'M3EButtonGroup',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Button group',
                builder:
                    _material_expressive_widgetbook_buttons_button_group
                        .buildButtonGroup,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'M3EExtendedFloatingActionButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Extended FAB',
                builder:
                    _material_expressive_widgetbook_buttons_floating_action_button
                        .buildExtendedFloatingActionButton,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'M3EFloatingActionButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'FAB',
                builder:
                    _material_expressive_widgetbook_buttons_floating_action_button
                        .buildFloatingActionButton,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
