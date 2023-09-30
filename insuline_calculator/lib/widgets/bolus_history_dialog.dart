import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/bolus_history_item.dart';
import 'package:intl/intl.dart';

  void showDialogHistory(BuildContext context, BolusHistoryItem bolus) {
    double unitsTotal = bolus.unitsFood + bolus.unitsGlucose;
    DateFormat dateFormat = DateFormat('dd-MM-yyyy h:mm a');
    String formattedTime = dateFormat.format(bolus.time);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.fromLTRB(20,15,20,7),
        actionsPadding: EdgeInsets.fromLTRB(0,8,0,15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        title: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: Theme.of(context).primaryColor,),
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          child: Text('Desglose Bolus', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),)),

        content: 
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/1.2,
            minWidth: MediaQuery.of(context).size.width/1.2,
            maxHeight: MediaQuery.of(context).size.height/2.2,
            ),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Text(formattedTime,style:TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      Expanded(child: Container()),
                      Text("$unitsTotal U", style:TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                    ]),

                    Divider(thickness: 3, height: 30, color: Theme.of(context).primaryColor),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Alimentos:",style:TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      Expanded(child: Container()),
                      Container(child: 
                        Column(crossAxisAlignment: CrossAxisAlignment.center, 
                          children: bolus.listFood.map((e) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: 
                              ConstrainedBox(constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width/3.2,
                              minWidth: MediaQuery.of(context).size.width/3.2,
                              ),
                              child: Text("*$e", style: TextStyle(fontSize: 14,),)),
                          )).toList(),),
                      ),
                      Expanded(child: Container()),
                      Text("${bolus.unitsFood} U", style:TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                    ]),


                    Divider(thickness: 3, height: 30, color: Theme.of(context).primaryColor),
                    Row(children: [
                      Text("Glucosa:",style:TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      Expanded(child: Container()),
                      Text("${bolus.glucoseLevel} mg/dl", style:TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                      Expanded(child: Container()),
                      Text("${bolus.unitsGlucose} U", style:TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
                    ]),

                ]),
              ))
            ),

        actions: [Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
              )
            ),
            child: Text('Cerrar',style: TextStyle(fontSize: 15, color: Colors.white),),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
        )],
      );
    },
  );
  }