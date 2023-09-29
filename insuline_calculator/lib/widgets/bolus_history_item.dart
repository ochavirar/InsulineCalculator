import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class BolusHistoryItem extends StatelessWidget {
  final DateTime time;
  final double unitsFood;
   //Lo mas probable es que se cambie este atributo al saber como se conectara con 
   //el resto de la aplicación
  final List<String> listFood;
  final double unitsGlucose;
  final double glucoseLevel; 

  BolusHistoryItem({
    super.key,
    required this.time,
    required this.unitsFood,
    required this.listFood,
    required this.unitsGlucose,
    required this.glucoseLevel,
  });



  @override
  Widget build(BuildContext context) {
    double unitsTotal = unitsFood + unitsGlucose;
    DateFormat dateFormat = DateFormat('dd-MM-yyyy h:mm a');
    String formattedTime = dateFormat.format(time);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).primaryColor,width: 2)
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Text(formattedTime,style:TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Expanded(child: Container()),
                  Text("$unitsTotal U", style:TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                  const SizedBox(width: 25),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 20),
                Text("Glucosa: $glucoseLevel mg/dl", style:TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                Expanded(child: Container(),),
                TextButton(
                  child: const Text('ABRIR'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
    );
  }
}