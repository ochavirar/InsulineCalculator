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
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: ElevatedButton(
          onPressed: () {
            if(Provider.of<SliderProvider>(context, listen: false).rangoValidoSliders()){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ConfirmationDialog();
                },
              );
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
        color: Theme.of(context).secondaryHeaderColor,
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
  Ranges(this.start, this.end);
}

class RangeSliderCategory extends StatefulWidget {
  const RangeSliderCategory({Key? key, required this.title, required this.id}) : super(key: key);
  final String title;
  final int id;
  @override
  State<RangeSliderCategory> createState() => _RangeSliderCategoryState();
}

class _RangeSliderCategoryState extends State<RangeSliderCategory> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).secondaryHeaderColor,
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
              : Provider.of<SliderProvider>(context).rangosCarbohidratos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    RangeSliderHours(index: index, id: widget.id), // Replace with your custom slider widget
                  ],
                );
              },
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  switch(widget.id){
                    case 0:
                      Provider.of<SliderProvider>(context, listen: false).agregarRangoGlucosa(Ranges(0, 23));
                      break;
                    case 1:
                      Provider.of<SliderProvider>(context, listen: false).agregarRangoCarbohidratos(Ranges(0, 23));
                      break;
                  }
                });
              },
              icon: const Icon(Icons.add_circle_outline_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSliderHours extends StatefulWidget {
  const RangeSliderHours({super.key, required this.index, required this.id});
  final int index;
  final int id;
  @override
  State<RangeSliderHours> createState() => _RangeSliderHoursState();
}

class _RangeSliderHoursState extends State<RangeSliderHours> {
  RangeValues values = const RangeValues(0, 23);
  RangeLabels labels = const RangeLabels('0', "23");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RangeSlider(
            divisions: 24,
            activeColor: Colors.black,
            inactiveColor: Theme.of(context).primaryColor,
            min: 0,
            max: 23,
            values: (widget.id == 0) 
            ? RangeValues(Provider.of<SliderProvider>(context).rangosGlucosa[widget.index].start.toDouble(),
              Provider.of<SliderProvider>(context).rangosGlucosa[widget.index].end.toDouble())
            : RangeValues(Provider.of<SliderProvider>(context).rangosCarbohidratos[widget.index].start.toDouble(),
              Provider.of<SliderProvider>(context).rangosCarbohidratos[widget.index].end.toDouble()),
            labels: labels,
            onChanged: (value) {
              setState(() {
                values = value;
                labels = RangeLabels("${value.start.toInt().toString()}:00",
                    "${value.end.toInt().toString()}:00");

                switch(widget.id){
                  case 0:
                    Provider.of<SliderProvider>(context, listen: false).rangosGlucosa[widget.index].start = value.start.toInt();
                    Provider.of<SliderProvider>(context, listen: false).rangosGlucosa[widget.index].end = value.end.toInt();
                    break;
                  case 1:
                    Provider.of<SliderProvider>(context, listen: false).rangosCarbohidratos[widget.index].start = value.start.toInt();
                    Provider.of<SliderProvider>(context, listen: false).rangosCarbohidratos[widget.index].end = value.end.toInt();
                    break;                  
                }

                Provider.of<SliderProvider>(context, listen: false).rangoValidoSliders();
              });
            }),
        Expanded(
          child: SizedBox(
            height: 60,
            child: TextField(
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
        activeColor: Colors.green[700],
        inactiveColor: Colors.blue[300],
        divisions: 250,
        min: 50,
        max: 300,
        values: values,
        labels: labels,
        onChanged: (value) {
          setState(() {
            values = value;
            labels = RangeLabels("${value.start.toInt().toString()}.",
                "${value.end.toInt().toString()}.");
          });
        });
  }
}
