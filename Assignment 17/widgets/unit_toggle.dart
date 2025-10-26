import 'package:flutter/material.dart';

class UnitToggle extends StatelessWidget {
  final List<String> labels;
  final String selected;
  final Function(String) onChange;

  const UnitToggle({
    super.key,
    required this.labels,
    required this.selected,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: labels.map((e) => e == selected).toList(),
      onPressed: (index) {
        onChange(labels[index]);
      },
      children: labels
          .map((e) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(e),
      ))
          .toList(),
    );
  }
}
