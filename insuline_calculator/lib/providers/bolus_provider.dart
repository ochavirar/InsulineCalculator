import 'package:flutter/material.dart';
import 'package:insuline_calculator/classes/food.dart';
import 'package:insuline_calculator/classes/food_detail.dart';
import 'package:insuline_calculator/classes/bolus.dart';
import 'package:insuline_calculator/dummy_data/dummy_data.dart';

class BolusProvider with ChangeNotifier {
  final Bolus _bolo = boloEpic;

  Bolus get boloTest => _bolo;

  double getCarbSum() {
    double sum = 0;
    for (FoodDetail detalle in _bolo.foodList) {
      sum += (detalle.quantity * detalle.alimento.basecarbs) /
          detalle.alimento.baseServingSize;
    }
    return sum;
  }
}
