import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/bolus_history_item.dart';

class ReportsProvider with ChangeNotifier{
  DateTime _startDate =  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day- DateTime.now().weekday % 7);
  DateTime _endDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day- DateTime.now().weekday % 7).add(Duration(days: 6));
  List<double> _listAvg = [];
  double _totalGlucoseAvg = 0;
  double _totalCarbsAvg = 0;
  double _totalUnitsAvg = 0;

  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;
  List<double> get listAvg => _listAvg;
  double get totalGlucoseAvg => _totalGlucoseAvg;
  double get totalCarbsAvg => _totalCarbsAvg;
  double get totalUnitsAvg => _totalUnitsAvg;




  set startDate(DateTime date){
    _startDate = date;
    notifyListeners();
  }

  set endDate(DateTime date){
    _endDate = date;
    notifyListeners();
  }

  void calculateAvg(Map<String, List<BolusHistoryItem>> mapBolus){
    int numDays = _endDate.difference(_startDate).inDays +1;
    _listAvg = List.filled(numDays, 0); 
    int counterBolus = 0;
    int counterDaysWithBolus= 0;
    double sumGlucose = 0;
    double sumCarbs = 0;
    double sumUnits = 0;
    _totalGlucoseAvg = 0;
    _totalCarbsAvg = 0;
    _totalUnitsAvg = 0;


    for(int i = 0;i<numDays;i++){
      //Si hay bolus registrados en la fecha, queremos sacar el promedio de estos
      print(_startDate.add(Duration(days: i)));
      print("\n\n");
      if(mapBolus.containsKey(_startDate.add(Duration(days: i)).toString().split(' ')[0])){
        print("Entro\n\n");
        counterDaysWithBolus++;
        counterBolus = 0;
        sumGlucose = 0;
        sumCarbs = 0;
        sumUnits = 0;

        for(int j = 0; j < mapBolus[_startDate.add(Duration(days: i)).toString().split(' ')[0]]!.length; j++){
          counterBolus++;
          sumGlucose += mapBolus[_startDate.add(Duration(days: i)).toString().split(' ')[0]]![j].glucoseLevel;
          sumCarbs += mapBolus[_startDate.add(Duration(days: i)).toString().split(' ')[0]]![j].carbs;
          sumUnits += mapBolus[_startDate.add(Duration(days: i)).toString().split(' ')[0]]![j].unitsFood+ mapBolus[_startDate.add(Duration(days: i)).toString().split(' ')[0]]![j].unitsGlucose ;

        }
        print(sumGlucose);
        print(counterBolus);
        sumGlucose /= counterBolus;
        sumCarbs /= counterBolus;
        sumUnits /= counterBolus;
        _listAvg[i] = sumGlucose;
        _totalGlucoseAvg += sumGlucose;
        _totalCarbsAvg += sumCarbs;
        _totalUnitsAvg += sumUnits;
      }
    }

    if(counterDaysWithBolus != 0){
      _totalGlucoseAvg /= counterDaysWithBolus;
      _totalCarbsAvg /= counterDaysWithBolus;
      _totalUnitsAvg /= counterDaysWithBolus;
    }
    print(_listAvg);
    notifyListeners();
  }

}