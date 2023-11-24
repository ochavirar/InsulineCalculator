class FullBolus {

  final DateTime time;
  final double unitsFood;
  final List<String> listFood;//juntar nombre, cantidad, unidades
  final double unitsGlucose;
  final double glucoseLevel; 
  final double carbs;

  FullBolus({    
    required this.time,
    required this.unitsFood,
    required this.listFood,
    required this.unitsGlucose,
    required this.glucoseLevel,
    required this.carbs
  });
}