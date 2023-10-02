import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/bolus_history_item.dart';

class MapEvents{
    Map<DateTime, List<BolusHistoryItem>>  _events = {
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
      
    DateTime.utc(2023,9,26) : [BolusHistoryItem(time: DateTime.utc(2023,9,28,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 110),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],
  };

  Map<DateTime, List<BolusHistoryItem>> get events => _events;
}
