import 'package:flutter/material.dart';

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
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
                  child: const Text("Objetivo: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ), 
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Ejemplo: 100',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: ElevatedButton(
            onPressed: () {}, 
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size(
                  MediaQuery.of(context).size.width * 0.5,
                  MediaQuery.of(context).size.height * 0.05,
                ),
              ),
            ),
            child: const Text('Guardar')
          ),
        ),
      ],
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
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
                child: Text(widget.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
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

class Ranges{
  int start;
  int end;
  Ranges(this.start, this.end);
}

class RangeSliderCategory extends StatefulWidget {
  const RangeSliderCategory({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RangeSliderCategory> createState() => _RangeSliderCategoryState();
}

class _RangeSliderCategoryState extends State<RangeSliderCategory> {
  List<Ranges> sliderTitles = [Ranges(0, 23)];

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
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
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
              itemCount: sliderTitles.length,
              itemBuilder: (context, index) {
                return const Column(
                  children: [
                    RangeSliderHours(), // Replace with your custom slider widget
                  ],
                );
              },
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  sliderTitles.add(Ranges(0, 23));
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
  const RangeSliderHours({super.key});

  @override
  State<RangeSliderHours> createState() => _RangeSliderHoursState();
}

class _RangeSliderHoursState extends State<RangeSliderHours> {
  RangeValues values = const RangeValues(0, 23);
  RangeLabels labels = const RangeLabels('0', "23");
  @override
  Widget build(BuildContext context) {
    return RangeSlider(  
      divisions: 24,
      activeColor: Theme.of(context).secondaryHeaderColor,
      inactiveColor: Theme.of(context).primaryColor,
      min: 0,
      max: 23,
      values: values,
      labels: labels,
      onChanged: (value){
      setState(() {
        values = value;
        labels = RangeLabels("${value.start.toInt().toString()}:00", "${value.end.toInt().toString()}:00");

      });
      }
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
      onChanged: (value){
      setState(() {
        values = value;
        labels = RangeLabels("${value.start.toInt().toString()}.", "${value.end.toInt().toString()}.");

      });
      }
    );
  }
}