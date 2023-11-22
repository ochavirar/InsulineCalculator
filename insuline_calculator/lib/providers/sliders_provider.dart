import 'dart:math';

import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/sensibility_widgets/forms.dart';

class SliderProvider with ChangeNotifier {
  //variables con los rangos
  List<Ranges> _rangosGlucosa = [];
  List<Ranges> _rangosCarbohidratos = [];

  List<Ranges> get rangosGlucosa => _rangosGlucosa;
  List<Ranges> get rangosCarbohidratos => _rangosCarbohidratos;

  //variables temporales con los valores de los rangos aun no guardados
  //TO DO

  //controladores de los textos
  List<TextEditingController> _listaControllersGlucosa = [];
  List<TextEditingController> get listaControllersGlucosa =>
      _listaControllersGlucosa;

  List<TextEditingController> _listaControllersCarbs = [];
  List<TextEditingController> get listaControllersCarbs =>
      _listaControllersCarbs;

  //listas de enteros que van a tener los valores asociados al rango, para poder cararlos y ponerlos al re abrir la pagina
  List<int> _glucoseSensArray = [];
  List<int> _carbsSensArray = [];

  int _currentGlucoseSens = 1;
  int _currentCarbsSens = 1;

  int get currentGlucoseSens => _currentGlucoseSens;
  int get currentCarbsSens => currentCarbsSens;

  void receiveTempValues(List<String> valores) {
    //recibir la string de valores
  }

  void agregarRangoGlucosa(Ranges rango) {
    _rangosGlucosa.add(rango);
    _listaControllersGlucosa.add(TextEditingController());
    //print(_rangosGlucosa.length);
    //print(rangosGlucosa.length);
    notifyListeners();
  }

  void agregarRangoCarbohidratos(Ranges rango) {
    _rangosCarbohidratos.add(rango);
    _listaControllersCarbs.add(TextEditingController());
    //print(_rangosCarbohidratos.length);
    //print(rangosCarbohidratos.length);
    notifyListeners();
  }

  bool isOverlap(int endTime, int nextStartTime) {
    return nextStartTime < endTime;
  }

  bool rangoValidoGlucosa() {
    if (_rangosGlucosa.length == 1) {
      return true;
    } else {
      List<Ranges> tmp = List.from(_rangosGlucosa);
      tmp.sort((a, b) => a.start.compareTo(b.start));
      for (int i = 0; i < tmp.length - 1; i++) {
        Ranges current = tmp[i];
        Ranges next = tmp[i + 1];
        if (isOverlap(current.end, next.start)) {
          return false;
        }
      }
      return true;
    }
  }

  bool rangoValidoCarbohidratos() {
    if (_rangosCarbohidratos.length == 1) {
      return true;
    } else {
      List<Ranges> tmp = List.from(_rangosCarbohidratos);
      tmp.sort((a, b) => a.start.compareTo(b.start));
      for (int i = 0; i < tmp.length - 1; i++) {
        Ranges current = tmp[i];
        Ranges next = tmp[i + 1];
        if (isOverlap(current.end, next.start)) {
          return false;
        }
      }
      return true;
    }
  }

  void borrarUltimoElementoGlucosa() {
    if (_rangosGlucosa.length > 1) {
      _rangosGlucosa.removeLast();
      notifyListeners();
    }
  }

  void borrarUltimoElementoCarbohidratos() {
    if (_rangosGlucosa.length > 1) {
      _rangosCarbohidratos.removeLast();
      notifyListeners();
    }
  }

  bool rangoValidoSliders() {
    //print(rangoValidoCarbohidratos() && rangoValidoGlucosa());
    bool retval = rangoValidoCarbohidratos() && rangoValidoGlucosa();

    //iterar por todos los text controllers y asegurarse que el texto no sea vacio
    for (int i = 0; i < _listaControllersCarbs.length; i++) {
      String value = _listaControllersCarbs[i].text;
      //print(value);
      if (value == '') {
        retval = false;
        break;
      }
    }
    for (int i = 0; i < _listaControllersGlucosa.length; i++) {
      if (_listaControllersGlucosa[i].text == '') {
        retval = false;
        break;
      }
    }

    //print(retval.toString());

    return retval;
    //agregar condicion que si hay text fields vacios no permita guardar
  }

  void saveNewSens() {
    //actualizar los valores de sensibilidad, la llamada a la funcion de verificar rango de sliders se hace desde el archivo de la pantalla
    //vamos a agregar los valores a un arreglo temporal correspondiente a los rangos
    //indice 0 de arreglo de rangos corresponde al indice 0 de valores de este arreglo
    _glucoseSensArray = [];
    for (int i = 0; i < _rangosGlucosa.length; i++) {
      _glucoseSensArray.add(int.parse(_listaControllersGlucosa[i].text));
    }

    _carbsSensArray = [];
    for (int i = 0; i < _rangosCarbohidratos.length; i++) {
      _carbsSensArray.add(int.parse(_listaControllersCarbs[i].text));
    }

    //print de rangos para debug
    for (int i = 0; i < _carbsSensArray.length; i++) {
      print(
          'inicio rango: ${_rangosCarbohidratos[i].start.toString()}. fin rango: ${_rangosCarbohidratos[i].end.toString()}. con sensibilidad: ${_carbsSensArray[i].toString()}');
    }
  }
}
