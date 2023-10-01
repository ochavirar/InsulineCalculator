import 'package:flutter/material.dart';

class ReportsProvider with ChangeNotifier{
  DateTime _startDate =  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day- DateTime.now().weekday % 7);
  DateTime _endDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day- DateTime.now().weekday % 7).add(Duration(days: 6));

  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;

  set startDate(DateTime date){
    _startDate = date;
    notifyListeners();
  }

  set endDate(DateTime date){
    _endDate = date;
    notifyListeners();
  }

}