import 'package:flutter/material.dart';
import 'dynamic_text_field.dart';
import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';

class ChangeGlucoseDialog extends StatelessWidget {
  ChangeGlucoseDialog({super.key});
  final controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Introducir Glucosa',
          style: const TextStyle(fontSize: 23),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DynamicTextField(
                  myController: controlador,
                  height: 50,
                  width: 120,
                  textInputType: TextInputType.number,
                  label: 'Valor',
                  maxlines: 1,
                  minlines: 1),
              Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    'mg/dl',
                    style: TextStyle(fontSize: 15),
                  ))
            ],
          )
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white)),
            TextButton(
                onPressed: () {
                  //llamar al provider a que actualice el valor de glucosa con lo que estaba en el textbox
                  context
                      .read<BolusProvider>()
                      .setGlucosa(int.parse(controlador.text));

                  Navigator.of(context).pop();
                },
                child: Text('Guardar'),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white))
          ],
        )
      ],
    );
  }
}
