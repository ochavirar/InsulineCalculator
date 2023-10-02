import 'package:flutter/material.dart';
import 'dynamic_text_field.dart';
import 'package:insuline_calculator/classes/food.dart';

import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';

class EditFoodDialog extends StatefulWidget {
  const EditFoodDialog({super.key, required this.food, required this.edit});

  final Food food;
  final bool edit;

  @override
  State<EditFoodDialog> createState() => _EditFoodDialogState();
}

class _EditFoodDialogState extends State<EditFoodDialog> {
  final controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          widget.edit ? 'Editar Cantidad' : 'Definir Cantidad',
          style: const TextStyle(fontSize: 23),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.food.title,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(
                  widget.food.imageUrl,
                ),
                height: 200,
                width: 200,
              ),
            ),
          ),
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
                    widget.food.unit,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white)),
            TextButton(
                onPressed: () {
                  //si viene de edit llamar la funcion editar del provider
                  //si no viene de edit, llamar la funcion agregar del provider
                  if (widget.edit) {
                    //funcion de editar del provider
                    context.read<BolusProvider>().changeFood(
                        widget.food, double.parse(controlador.text));
                  } else {
                    context
                        .read<BolusProvider>()
                        .addFood(widget.food, double.parse(controlador.text));
                  }

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
