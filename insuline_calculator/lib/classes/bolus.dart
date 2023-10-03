//incompleta, faltan mas atributos, pero por ahora solo se tendra la lista de detalles de alimentos y glucosa

import 'food_detail.dart';

class Bolus {
  List<FoodDetail> foodList;
  int glucosa;
  Bolus({required this.foodList, this.glucosa = 100});
}
