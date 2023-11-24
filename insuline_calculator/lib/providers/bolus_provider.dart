import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insuline_calculator/classes/food.dart';
import 'package:insuline_calculator/classes/food_detail.dart';
import 'package:insuline_calculator/classes/bolus.dart';
import 'package:insuline_calculator/classes/full_bolus.dart';
import 'package:insuline_calculator/providers/sliders_provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insuline_calculator/widgets/history_widgets/bolus_history_item.dart';
import 'package:provider/provider.dart';

class BolusProvider with ChangeNotifier {
  //Bolus _bolo = boloEpic;
  Bolus _bolo = Bolus(foodList: []);
  Bolus get boloTest => _bolo;

  double _carbInsulin = 0;
  double get carbInsulin => _carbInsulin;

  double _glucoseInsulin = 0;
  double get glucoseInsulin => _glucoseInsulin;

  double _carbSum = 0;
  double get carbSum => _carbSum;

  List<FullBolus> _listBolus = [];
  List<BolusHistoryItem> _listHistoryBolus = [];

  Map<String, List<FullBolus>> cleanMap = {};
  Map<String, List<BolusHistoryItem>> historyMap = {};
  List<Map<String, dynamic>> userBolus = [];  
  

  void getCarbSum() {
    _carbSum = 0;
    for (FoodDetail detalle in _bolo.foodList) {
      _carbSum += (detalle.quantity * detalle.alimento.basecarbs) /
          detalle.alimento.baseServingSize;
    }
  }

  void calculateBolus(BuildContext context) {
    int sensCarbs = Provider.of<SliderProvider>(context, listen: false)
        .getCurrentCarbsSens(DateTime.now());
    int sensGlucose = Provider.of<SliderProvider>(context, listen: false)
        .getCurrentGlucoseSens(DateTime.now());

    getCarbSum();
    _carbInsulin = _carbSum / sensCarbs;

    //int glucoseTarget = 100; //esta se recuperara de lo que pusieron en settings
    int glucoseTarget =
        Provider.of<SliderProvider>(context, listen: false).target;
    _glucoseInsulin = (_bolo.glucosa - glucoseTarget) / sensGlucose;

    print(
        'Sens carbs: ${sensCarbs}, sens Glucose: ${sensGlucose}, glucoseTarget = ${glucoseTarget}');
  }

  void setGlucosa(int glucosa, BuildContext context) {
    _bolo.glucosa = glucosa;
    calculateBolus(context);
    notifyListeners();
  }

  void addFood(Food comida, double quantity, BuildContext context) {
    _bolo.foodList.add(FoodDetail(alimento: comida, quantity: quantity));
    getCarbSum();
    calculateBolus(context);
    notifyListeners();
  }

  void changeFood(Food comida, double quantity, BuildContext context) {
    //buscar el elemento a cambiar en el arreglo
    FoodDetail toChange =
        _bolo.foodList.firstWhere((man) => man.alimento == comida);

    toChange.quantity = quantity;

    getCarbSum();
    calculateBolus(context);
    notifyListeners();
  }

  void deleteFood(Food comida, BuildContext context) {
    _bolo.foodList.removeWhere((man) => man.alimento == comida);

    getCarbSum();
    calculateBolus(context);
    notifyListeners();
  }

  //deberia ser future but idk
  void saveBolus() async {
    //llamada a fireman
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser!;
    String mailID = user.email ?? 'error';

    // CollectionReference collection =
    //     FirebaseFirestore.instance.collection('bolus');
    DateTime now = DateTime.now();

    List<String> listaAlimentos = [];
    List<String> listaUnidades = [];
    List<double> lista_cantidades = [];

    for (int i = 0; i < _bolo.foodList.length; i++) {
      listaAlimentos.add(_bolo.foodList[i].alimento.title);
      listaUnidades.add(_bolo.foodList[i].alimento.unit);
      lista_cantidades.add(_bolo.foodList[i].quantity);
    }

    Map<String, dynamic> data = {
      'email': mailID,
      'carbs': _carbSum,
      'fecha': Timestamp.fromDate(now),
      'nivel_glucosa': _bolo.glucosa,
      'unidades_alimento': _carbInsulin,
      'unidades_glucosa': _glucoseInsulin,
      'lista_alimentos': listaAlimentos, //lista de strings
      'lista_unidades': listaUnidades, //lista de strings
      'lista_cantidades': lista_cantidades //lista de ints
    };

    print(data);
    FirebaseFirestore.instance
        .collection("bolus")
        .doc(mailID +
            '${now.year}${now.month}${now.day}${now.hour}${now.minute}')
        .set(data);
    // await collection.add(data);

    //resetear valores
    _carbInsulin = 0;
    _carbSum = 0;
    _glucoseInsulin = 0;
    _bolo = Bolus(foodList: []);
  }

  // Crear mapa para usar en calendario historial y gráfica de reportes
  Future<Map<String, List<FullBolus>>> createCleanMap() async{
    Map<String, List<FullBolus>> cleanMap = {};
    await getBolus();
    for(int i = 0; i<_listBolus.length; i++){
      String strDate = _listBolus[i].time.toString();
      String dateSliced = strDate.split(' ')[0]; 
      if(!cleanMap.containsKey(dateSliced)){ // La llave es solo la parte de la fecha en string para el mapa, si no está crearla
        cleanMap[dateSliced] = [_listBolus[i]];
      } 
      else{
        cleanMap[dateSliced]?.add(_listBolus[i]);
      }
    }
    return cleanMap;
  }


  
  Future<void> getBolus() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser!;
    String mailID = user.email ?? 'error';

    var userBolus =  await FirebaseFirestore.instance
    .collection("bolus")
    .where('email', isEqualTo: mailID)
    .get();
    _listBolus = [];
    _listHistoryBolus = [];

    userBolus.docs.forEach((element) {
      var currentBolus = FullBolus(
        
        time: element["fecha"].toDate(),
        unitsFood: element["unidades_alimento"].toDouble(),
        listFood: ["placeholder 20ml","placeholder 30g","placeholder 10ml"], //TODO crear la lista de strings segun los alimentos que hay
        unitsGlucose: element["unidades_glucosa"].toDouble(),
        glucoseLevel: element["nivel_glucosa"].toDouble(),
        carbs: element["carbs"].toDouble(),
      );

      var historyBolus = BolusHistoryItem(
        time: element["fecha"].toDate(),
        unitsFood: element["unidades_alimento"].toDouble(),
        listFood: ["placeholder 20ml","placeholder 30g","placeholder 10ml"], //TODO crear la lista de strings segun los alimentos que hay
        unitsGlucose: element["unidades_glucosa"].toDouble(),
        glucoseLevel: element["nivel_glucosa"].toDouble(),
        carbs: element["carbs"].toDouble(),
      );

      _listBolus.add(currentBolus);
      _listHistoryBolus.add(historyBolus);
      
    });

  }


    // Crear mapa para usar en calendario historial y gráfica de reportes
  Future<void> createHistoryMap() async{
    Map<String, List<BolusHistoryItem>> cleanMap = {};
    await getBolus();
    for(int i = 0; i<_listHistoryBolus.length; i++){
      String strDate = _listHistoryBolus[i].time.toString();
      String dateSliced = strDate.split(' ')[0]; 
      if(!cleanMap.containsKey(dateSliced)){ // La llave es solo la parte de la fecha en string para el mapa, si no está crearla
        cleanMap[dateSliced] = [_listHistoryBolus[i]];
      } 
      else{
        cleanMap[dateSliced]?.add(_listHistoryBolus[i]);
      }
    }
    historyMap = cleanMap;
  }


  

}
