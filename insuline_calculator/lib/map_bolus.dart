// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/bolus_history_item.dart';

class MapEvents{
    Map<DateTime, List<BolusHistoryItem>>  _events = {
//1
    DateTime.utc(2023,9,1) : [BolusHistoryItem(time: DateTime.utc(2023,9,1,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,1,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],
//2
    DateTime.utc(2023,9,2) : [BolusHistoryItem(time: DateTime.utc(2023,9,2,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,2,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 120),
      ],
//3
    DateTime.utc(2023,9,3) : [BolusHistoryItem(time: DateTime.utc(2023,9,3,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,3,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 110),
      ],

    DateTime.utc(2023,9,4) : [BolusHistoryItem(time: DateTime.utc(2023,9,4,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,4,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130),
      ],

    DateTime.utc(2023,9,5) : [BolusHistoryItem(time: DateTime.utc(2023,9,5,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,5,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 150),
      ],

    DateTime.utc(2023,9,6) : [BolusHistoryItem(time: DateTime.utc(2023,9,6,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,6,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],

    DateTime.utc(2023,9,7) : [BolusHistoryItem(time: DateTime.utc(2023,9,7,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,7,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 110),
      ],


    DateTime.utc(2023,9,8) : [BolusHistoryItem(time: DateTime.utc(2023,9,8,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,8,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130),
      ],

    DateTime.utc(2023,9,9) : [BolusHistoryItem(time: DateTime.utc(2023,9,9,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,9,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],


    DateTime.utc(2023,9,10) : [BolusHistoryItem(time: DateTime.utc(2023,9,10,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,10,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],
// 11 lo omitimos

    DateTime.utc(2023,9,12) : [BolusHistoryItem(time: DateTime.utc(2023,9,12,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,12,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],


    DateTime.utc(2023,9,13) : [BolusHistoryItem(time: DateTime.utc(2023,9,13,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,13,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],

//14 y 15 lo omitimos



    DateTime.utc(2023,9,16) : [BolusHistoryItem(time: DateTime.utc(2023,9,16,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,16,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130),
      ],

    DateTime.utc(2023,9,17) : [BolusHistoryItem(time: DateTime.utc(2023,9,17,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,17,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 150),
      ],

    DateTime.utc(2023,9,18) : [BolusHistoryItem(time: DateTime.utc(2023,9,18,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,18,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],

    DateTime.utc(2023,9,19) : [BolusHistoryItem(time: DateTime.utc(2023,9,19,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,19,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 110),
      ],


    DateTime.utc(2023,9,20) : [BolusHistoryItem(time: DateTime.utc(2023,9,20,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,20,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130),
      ],
//21 lo omitimos

    DateTime.utc(2023,9,22) : [BolusHistoryItem(time: DateTime.utc(2023,9,22,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,22,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130),
      ],

    DateTime.utc(2023,9,23) : [BolusHistoryItem(time: DateTime.utc(2023,9,23,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,23,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 150),
      ],

    DateTime.utc(2023,9,24) : [BolusHistoryItem(time: DateTime.utc(2023,9,24,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,24,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],

    DateTime.utc(2023,9,25) : [BolusHistoryItem(time: DateTime.utc(2023,9,25,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 160),
      BolusHistoryItem(time: DateTime.utc(2023,9,25,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130),
      ],


    DateTime.utc(2023,9,26) : [BolusHistoryItem(time: DateTime.utc(2023,9,26,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 140),
      BolusHistoryItem(time: DateTime.utc(2023,9,26,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 130),
      ],
  //27 lo omitimos

    DateTime.utc(2023,9,28) : [BolusHistoryItem(time: DateTime.utc(2023,9,28,8,5), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 120),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,18,23), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Texto largo para probar overflow 30g", "Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g",
      "Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g",], 
      unitsGlucose: 1.5, glucoseLevel: 130),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],
      
    DateTime.utc(2023,9,29) : [BolusHistoryItem(time: DateTime.utc(2023,9,29,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 110),
      BolusHistoryItem(time: DateTime.utc(2023,9,29,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],
  };

  Map<DateTime, List<BolusHistoryItem>> get events => _events;
}
