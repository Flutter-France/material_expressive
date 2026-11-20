import 'package:material_expressive/material_expressive.dart';
import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _items = [
  (icon: Icons.format_align_left, label: 'Left'),
  (icon: Icons.format_align_center, label: 'Center'),
  (icon: Icons.format_align_right, label: 'Right'),
  (icon: Icons.format_align_justify, label: 'Justify'),
];

enum _Content { iconAndLabel, label, icon }

@widgetbook.UseCase(name: 'Button group', type: M3EButtonGroup)
Widget buildButtonGroup(BuildContext context) {
  final knobs = context.knobs;
  return _ButtonGroupUseCase(
    mode: knobs.object.dropdown(
      label: 'Mode',
      options: ButtonGroupMode.values,
      labelBuilder: (m) => m.name,
    ),
    size: knobs.object.dropdown(
      label: 'Size',
      options: ButtonSize.values,
      initialOption: ButtonSize.medium,
      labelBuilder: (s) => s.name,
    ),
    content: knobs.object.dropdown(
      label: 'Content',
      options: _Content.values,
      labelBuilder: (c) => c.name,
    ),
    itemCount: knobs.int.slider(
      label: 'Items',
      initialValue: 3,
      min: 2,
      max: _items.length,
    ),
    multiSelectionEnabled: knobs.boolean(label: 'Multi selection'),
    emptySelectionAllowed: knobs.boolean(label: 'Empty selection allowed'),
    showSelectedIcon: knobs.boolean(
      label: 'Show selected icon',
      initialValue: true,
    ),
    enabled: knobs.boolean(label: 'Enabled', initialValue: true),
  );
}

/// Holds the selection so toggling works in the catalog.
class _ButtonGroupUseCase extends StatefulWidget {
  const _ButtonGroupUseCase({
    required this.mode,
    required this.size,
    required this.content,
    required this.itemCount,
    required this.multiSelectionEnabled,
    required this.emptySelectionAllowed,
    required this.showSelectedIcon,
    required this.enabled,
  });

  final ButtonGroupMode mode;
  final ButtonSize size;
  final _Content content;
  final int itemCount;
  final bool multiSelectionEnabled;
  final bool emptySelectionAllowed;
  final bool showSelectedIcon;
  final bool enabled;

  @override
  State<_ButtonGroupUseCase> createState() => _ButtonGroupUseCaseState();
}

class _ButtonGroupUseCaseState extends State<_ButtonGroupUseCase> {
  Set<int> _selected = {0};

  @override
  Widget build(BuildContext context) {
    // Knob changes can leave a selection the group's asserts reject; fix it up.
    var selected = _selected.where((i) => i < widget.itemCount).toSet();
    if (!widget.multiSelectionEnabled && selected.length > 1) {
      selected = {selected.first};
    }
    if (selected.isEmpty && !widget.emptySelectionAllowed) selected = {0};

    final showIcon = widget.content != _Content.label;
    final showLabel = widget.content != _Content.icon;

    return Center(
      child: M3EButtonGroup<int>(
        mode: widget.mode,
        size: widget.size,
        multiSelectionEnabled: widget.multiSelectionEnabled,
        emptySelectionAllowed: widget.emptySelectionAllowed,
        showSelectedIcon: widget.showSelectedIcon,
        selected: selected,
        onSelectionChanged: (s) => setState(() => _selected = s),
        items: [
          for (var i = 0; i < widget.itemCount; i++)
            ButtonGroupItem(
              value: i,
              icon: showIcon ? Icon(_items[i].icon) : null,
              label: showLabel ? Text(_items[i].label) : null,
              tooltip: _items[i].label,
              enabled: widget.enabled,
            ),
        ],
      ),
    );
  }
}
