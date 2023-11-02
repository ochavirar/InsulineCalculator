import 'package:flutter/material.dart';
import 'package:insuline_calculator/providers/sliders_provider.dart';
import 'package:insuline_calculator/screens/main_screen.dart';
import 'package:provider/provider.dart';

class Objective extends StatelessWidget {
  const Objective({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.width * 0.15,
          ),
          child: const Middle(),
        ),
        const ButtonContainer(),
      ],
    );
  }
}

class Middle extends StatelessWidget {
  const Middle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.01),
            child: const Text(
              "Objetivo: ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Ejemplo: 100',
          ),
        ),
      ],
    );
  }
}

class AlertDialogSlider extends StatelessWidget {
  const AlertDialogSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Confirmación'),
      content: Text('El rango de horas no es válido'),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Cambios correctos'),
      content: const Text('Se han guardado los cambios'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            );
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: ElevatedButton(
          onPressed: () {
            if (Provider.of<SliderProvider>(context, listen: false)
                .rangoValidoSliders()) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ConfirmationDialog();
                },
              );

              //si se presiono el botón y los sliders son correctos llamar funcion de actualizar sensibilidad
              Provider.of<SliderProvider>(context, listen: false).saveNewSens();
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialogSlider();
                },
              );
            }
          },
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(
              Size(
                MediaQuery.of(context).size.width * 0.5,
                MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ),
          child: const Text('Guardar')),
    );
  }
}

class RangeSliderObjective extends StatefulWidget {
  const RangeSliderObjective({super.key, required this.title});
  final String title;

  @override
  State<RangeSliderObjective> createState() => _RangeSliderObjectiveState();
}

class _RangeSliderObjectiveState extends State<RangeSliderObjective> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.15,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const RangeSliderTarget(),
          ],
        ),
      ),
    );
  }
}

class Ranges {
  int start;
  int end;
  //int sens = 1; //sensibilidad de
  Ranges(this.start, this.end);
}

class RangeSliderCategory extends StatefulWidget {
  const RangeSliderCategory({Key? key, required this.title, required this.id})
      : super(key: key);
  final String title;
  final int id;
  @override
  State<RangeSliderCategory> createState() => _RangeSliderCategoryState();
}

class _RangeSliderCategoryState extends State<RangeSliderCategory> {
  List<TextEditingController> _textFieldControllers = [];
  List<String> _textFieldValues = [];

  void getTextFieldValues() {
    _textFieldValues = [];

    for (int i = 0; i < _textFieldControllers.length; i++) {
      //recuperar los valores y guardarlo en el arreglo
      _textFieldValues.add(_textFieldControllers[i].text);

      if (widget.id == 0) {
        //llamar actualizar glucosa
      } else {
        //llamar actualizar sensibilidad de carbs
      }
    }
  }

  void listenForChanges() {
    getTextFieldValues();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.15,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: (widget.id == 0)
                  ? Provider.of<SliderProvider>(context).rangosGlucosa.length
                  : Provider.of<SliderProvider>(context)
                      .rangosCarbohidratos
                      .length,
              itemBuilder: (context, index) {
                _textFieldControllers.add(TextEditingController());
                return Column(
                  children: [
                    RangeSliderHours(
                      index: index,
                      id: widget.id,
                      controlador: _textFieldControllers[index],
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      switch (widget.id) {
                        case 0:
                          Provider.of<SliderProvider>(context, listen: false)
                              .agregarRangoGlucosa(Ranges(0, 24));
                          break;
                        case 1:
                          Provider.of<SliderProvider>(context, listen: false)
                              .agregarRangoCarbohidratos(Ranges(0, 24));
                          break;
                      }
                    });
                  },
                  icon: const Icon(Icons.add_circle_outline_rounded),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        switch (widget.id) {
                          case 0:
                            Provider.of<SliderProvider>(context, listen: false)
                                .borrarUltimoElementoGlucosa();
                            break;
                          case 1:
                            Provider.of<SliderProvider>(context, listen: false)
                                .borrarUltimoElementoCarbohidratos();
                            break;
                        }
                      });
                    },
                    icon: const Icon(Icons.delete_rounded))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSliderHours extends StatefulWidget {
  const RangeSliderHours(
      {super.key,
      required this.index,
      required this.id,
      required this.controlador});
  final int index;
  final int id;
  final TextEditingController controlador;
  @override
  State<RangeSliderHours> createState() => _RangeSliderHoursState();
}

class _RangeSliderHoursState extends State<RangeSliderHours> {
  RangeValues values = const RangeValues(0, 24);
  RangeLabels labels = const RangeLabels('0', "24");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RangeSlider(
            divisions: 24,
            activeColor: Theme.of(context).colorScheme.tertiary,
            inactiveColor: Theme.of(context).colorScheme.onTertiary,
            min: 0,
            max: 24,
            values: (widget.id == 0)
                ? RangeValues(
                    Provider.of<SliderProvider>(context)
                        .rangosGlucosa[widget.index]
                        .start
                        .toDouble(),
                    Provider.of<SliderProvider>(context)
                        .rangosGlucosa[widget.index]
                        .end
                        .toDouble())
                : RangeValues(
                    Provider.of<SliderProvider>(context)
                        .rangosCarbohidratos[widget.index]
                        .start
                        .toDouble(),
                    Provider.of<SliderProvider>(context)
                        .rangosCarbohidratos[widget.index]
                        .end
                        .toDouble()),
            labels: labels,
            onChanged: (value) {
              setState(() {
                values = value;
                labels = RangeLabels("${value.start.toInt().toString()}:00",
                    "${value.end.toInt().toString()}:00");

                switch (widget.id) {
                  case 0:
                    Provider.of<SliderProvider>(context, listen: false)
                        .rangosGlucosa[widget.index]
                        .start = value.start.toInt();
                    Provider.of<SliderProvider>(context, listen: false)
                        .rangosGlucosa[widget.index]
                        .end = value.end.toInt();
                    break;
                  case 1:
                    Provider.of<SliderProvider>(context, listen: false)
                        .rangosCarbohidratos[widget.index]
                        .start = value.start.toInt();
                    Provider.of<SliderProvider>(context, listen: false)
                        .rangosCarbohidratos[widget.index]
                        .end = value.end.toInt();
                    break;
                }

                Provider.of<SliderProvider>(context, listen: false)
                    .rangoValidoSliders();
              });
            }),
        Expanded(
          child: SizedBox(
            height: 60,
            child: TextField(
              controller: widget.controlador,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              keyboardAppearance: Brightness.light,
              keyboardType: TextInputType.number,
            ),
          ),
        )
      ],
    );
  }
}

class RangeSliderTarget extends StatefulWidget {
  const RangeSliderTarget({super.key});

  @override
  State<RangeSliderTarget> createState() => _RangeSliderTargetState();
}

class _RangeSliderTargetState extends State<RangeSliderTarget> {
  RangeValues values = const RangeValues(50, 300);
  RangeLabels labels = const RangeLabels('50', "300");
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
        activeColor: Theme.of(context).colorScheme.onSecondaryContainer,
        inactiveColor: Theme.of(context).colorScheme.secondaryContainer,
        divisions: 250,
        min: 50,
        max: 300,
        values: values,
        labels: labels,
        onChanged: (value) {
          setState(() {
            values = value;
            labels = RangeLabels(
                value.start.toInt().toString(), value.end.toInt().toString());
          });
        });
  }
}
