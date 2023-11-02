import 'package:flutter/material.dart';
import 'package:insuline_calculator/providers/storage_provider.dart';
import 'package:provider/provider.dart';


class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final TextEditingController controllerUnits = TextEditingController();
  String? _selectedUnit;

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
        menuHeight: 190,
        initialSelection: units[0],
        controller: controllerUnits,
        dropdownMenuEntries: unitEntries,
        onSelected: (String? unit) {
          setState(() {
            _selectedUnit = unit;
            Provider.of<StorageProvider>(context, listen: false).selectedUnit = unit!;
          });
        },
      );
  }

  get selectedUnit => _selectedUnit;       
  
  List<String> units = [
    'g',
    'ml',
    'oz',
    'piezas',
    'taza',
  ];
}