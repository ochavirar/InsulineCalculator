import 'package:flutter/material.dart';

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final TextEditingController controllerUnits = TextEditingController();
  String? selectedUnit;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<String>> unitEntries =
        <DropdownMenuEntry<String>>[];
    for (final String unit in units) {
      unitEntries.add(
        DropdownMenuEntry<String>(
            value: unit, label: unit,),
      );
    }

    return DropdownMenu<String>(
        width: 120,
        menuHeight: 200,
        initialSelection: units[0],
        controller: controllerUnits,
        dropdownMenuEntries: unitEntries,
        onSelected: (String? unit) {
          setState(() {
            selectedUnit = unit;
          });
        },
      );
  }
            
  List<String> units = [
    'g',
    'ml',
    'oz',
    'piezas',
    'taza',
  ];
}