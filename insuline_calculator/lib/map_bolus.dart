// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_final_fields


import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/bolus_history_item.dart';

//VALORES HARDCODEADOS PARA PROBAR CALENDARIO DE HISTORIAL Y REPORTES
class MapEvents{
    Map<String, List<BolusHistoryItem>>  _events = {
//1
    DateTime.utc(2023,9,1).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,1,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 40),
      BolusHistoryItem(time: DateTime.utc(2023,9,1,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 30),
      ],
//2
    DateTime.utc(2023,9,2).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,2,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 20),
      BolusHistoryItem(time: DateTime.utc(2023,9,2,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 120, carbs: 40),
      ],
//3
    DateTime.utc(2023,9,3).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,3,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs:20),
      BolusHistoryItem(time: DateTime.utc(2023,9,3,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 110, carbs: 60),
      ],

    DateTime.utc(2023,9,4).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,4,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 70),
      BolusHistoryItem(time: DateTime.utc(2023,9,4,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130, carbs: 65),
      ],

    DateTime.utc(2023,9,5).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,5,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 40),
      BolusHistoryItem(time: DateTime.utc(2023,9,5,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 150, carbs: 50),
      ],

    DateTime.utc(2023,9,6).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,6,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 50),
      BolusHistoryItem(time: DateTime.utc(2023,9,6,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 50),
      ],

    DateTime.utc(2023,9,7).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,7,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 65),
      BolusHistoryItem(time: DateTime.utc(2023,9,7,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 110, carbs: 37),
      ],


    DateTime.utc(2023,9,8).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,8,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 50),
      BolusHistoryItem(time: DateTime.utc(2023,9,8,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130,carbs: 30),
      ],

    DateTime.utc(2023,9,9).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,9,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 60),
      BolusHistoryItem(time: DateTime.utc(2023,9,9,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 40),
      ],


    DateTime.utc(2023,9,10).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,10,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 50),
      BolusHistoryItem(time: DateTime.utc(2023,9,10,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 70),
      ],
// 11 lo omitimos

    DateTime.utc(2023,9,12).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,12,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 30),
      BolusHistoryItem(time: DateTime.utc(2023,9,12,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 40),
      ],


    DateTime.utc(2023,9,13).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,13,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs:30),
      BolusHistoryItem(time: DateTime.utc(2023,9,13,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 30),
      ],

//14 y 15 lo omitimos



    DateTime.utc(2023,9,16).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,16,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 40),
      BolusHistoryItem(time: DateTime.utc(2023,9,16,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130, carbs: 40),
      ],

    DateTime.utc(2023,9,17).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,17,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 50),
      BolusHistoryItem(time: DateTime.utc(2023,9,17,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 150, carbs: 60),
      ],

    DateTime.utc(2023,9,18).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,18,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 70),
      BolusHistoryItem(time: DateTime.utc(2023,9,18,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 55),
      ],

    DateTime.utc(2023,9,19).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,19,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 80),
      BolusHistoryItem(time: DateTime.utc(2023,9,19,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 110, carbs: 60),
      ],


    DateTime.utc(2023,9,20).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,20,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 50),
      BolusHistoryItem(time: DateTime.utc(2023,9,20,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130, carbs: 40),
      ],
//21 lo omitimos

    DateTime.utc(2023,9,22).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,22,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 50),
      BolusHistoryItem(time: DateTime.utc(2023,9,22,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130, carbs: 40),
      ],

    DateTime.utc(2023,9,23).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,23,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 50),
      BolusHistoryItem(time: DateTime.utc(2023,9,23,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 150, carbs: 70),
      ],

    DateTime.utc(2023,9,24).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,24,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 65),
      BolusHistoryItem(time: DateTime.utc(2023,9,24,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 70),
      ],

    DateTime.utc(2023,9,25).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,25,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 160, carbs: 50),
      BolusHistoryItem(time: DateTime.utc(2023,9,25,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130, carbs: 45),
      ],


    DateTime.utc(2023,9,26).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,26,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140, carbs: 30),
      BolusHistoryItem(time: DateTime.utc(2023,9,26,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130, carbs: 50),
      ],
  //27 lo omitimos

    DateTime.utc(2023,9,28).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,28,8,5), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 50),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 120, carbs: 40),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,18,23), unitsFood: 5.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Texto largo para probar overflow 30g", "Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g",
      "Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g",], 
      unitsGlucose: 1.5, glucoseLevel: 130, carbs: 300),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 30),
      ],
      
    DateTime.utc(2023,10,1).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,29,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 110, carbs: 40),
      BolusHistoryItem(time: DateTime.utc(2023,9,29,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 50),
      ],
            
    DateTime.utc(2023,10,2).toString().split(' ')[0] : [BolusHistoryItem(time: DateTime.utc(2023,9,29,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 110, carbs: 40),
      BolusHistoryItem(time: DateTime.utc(2023,9,29,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 150, carbs: 30),
      BolusHistoryItem(time: DateTime.utc(2023,9,29,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100, carbs: 50),
      ],
  };

  Map<String, List<BolusHistoryItem>> get events => _events;


}
