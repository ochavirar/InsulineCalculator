import 'package:flutter/material.dart';
import 'package:insuline_calculator/screens/edit_profile.dart';
import 'package:insuline_calculator/widgets/sensibility_widgets/forms.dart';
import 'package:insuline_calculator/widgets/utilities/side_bar.dart';

class SensibilityContainer extends StatelessWidget {
  const SensibilityContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Factor de sensibilidad',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      drawer: const SideBar(),
      body: ListView(
        children: const [
          RangeSliderCategory(title: "Glucosa"),
          RangeSliderCategory(title: "Carbohidratos"),
          RangeSliderObjective(title: "Rango buscado"),
          Objective()
        ],
      ),
    );
  }
}
