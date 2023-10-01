import 'package:flutter/material.dart';
import 'package:insuline_calculator/screens/edit_profile.dart';
import 'package:insuline_calculator/widgets/sensibility_widgets/forms.dart';

class SensibilityContainer extends StatelessWidget {
  const SensibilityContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factor de sensibilidad'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const EditProfile()
                )	
              );
            },
          ),
        ],
      ),
      body: ListView(
        children:  const [
          RangeSliderCategory(title: "Glucosa"),
          RangeSliderCategory(title: "Carbohidratos"),
          RangeSliderObjective(title: "Rango buscado"	),
          Objective()
        ],
      ),
    );
  }
}