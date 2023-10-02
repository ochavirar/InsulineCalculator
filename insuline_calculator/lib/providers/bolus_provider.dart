import 'package:flutter/material.dart';
import 'package:insuline_calculator/classes/food.dart';
import 'package:insuline_calculator/classes/food_detail.dart';
import 'package:insuline_calculator/classes/bolus.dart';
import 'package:insuline_calculator/dummy_data/dummy_data.dart';

class BolusProvider with ChangeNotifier {
  Bolus _bolo = boloEpic;
  Bolus get boloTest => _bolo;

  double _carbInsulin = 0;
  double get carbInsulin => _carbInsulin;

  double _glucoseInsulin = 0;
  double get glucoseInsulin => _glucoseInsulin;

  double _carbSum = 0;
  double get carbSum => _carbSum;

  void getCarbSum() {
    _carbSum = 0;
    for (FoodDetail detalle in _bolo.foodList) {
      _carbSum += (detalle.quantity * detalle.alimento.basecarbs) /
          detalle.alimento.baseServingSize;
    }
  }

  void calculateBolus() {
    int sensCarbs = 15;
    int sensGlucose = 12;

    getCarbSum();
    _carbInsulin = _carbSum / sensCarbs;

    int glucoseTarget = 100; //esta se recuperara de lo que pusieron en settings
    _glucoseInsulin = (_bolo.glucosa - glucoseTarget) / sensGlucose;
  }

  void setGlucosa(int glucosa) {
    _bolo.glucosa = glucosa;
    calculateBolus();
    notifyListeners();
  }

  void addFood(Food comida, double quantity) {
    _bolo.foodList.add(FoodDetail(alimento: comida, quantity: quantity));
    getCarbSum();
    calculateBolus();
    notifyListeners();
  }

  void changeFood(Food comida, double quantity) {
    //buscar el elemento a cambiar en el arreglo
    FoodDetail toChange =
        _bolo.foodList.firstWhere((man) => man.alimento == comida);

    toChange.quantity = quantity;

    getCarbSum();
    calculateBolus();
    notifyListeners();
  }

  void deleteFood(Food comida) {
    _bolo.foodList.removeWhere((man) => man.alimento == comida);

    getCarbSum();
    calculateBolus();
    notifyListeners();
  }
}
