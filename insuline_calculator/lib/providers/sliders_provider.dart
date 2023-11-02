import 'dart:math';

import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/sensibility_widgets/forms.dart';

class SliderProvider with ChangeNotifier {
  // List<Ranges> _rangosGlucosa = [Ranges(0, 24)];
  // List<Ranges> _rangosCarbohidratos = [Ranges(0, 24)];
  List<Ranges> _rangosGlucosa = [];
  List<Ranges> _rangosCarbohidratos = [];

  List<Ranges> get rangosGlucosa => _rangosGlucosa;
  List<Ranges> get rangosCarbohidratos => _rangosCarbohidratos;

  //variables que van a traer los valores de sensibilidad de cada hora
  List<int> glucoseSensArray = [];
  List<int> carbsSensArray = [];

  int _currentGlucoseSens = 1;
  int _currentCarbsSens = 1;

  int get currentGlucoseSens => _currentGlucoseSens;
  int get currentCarbsSens => currentCarbsSens;

  void receiveTempValues(List<String> valores) {
    //recibir la string de valores
  }

  void agregarRangoGlucosa(Ranges rango) {
    _rangosGlucosa.add(rango);
    //print(_rangosGlucosa.length);
    //print(rangosGlucosa.length);
    notifyListeners();
  }

  void agregarRangoCarbohidratos(Ranges rango) {
    _rangosCarbohidratos.add(rango);
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
    print(rangoValidoCarbohidratos() && rangoValidoGlucosa());
    return rangoValidoCarbohidratos() && rangoValidoGlucosa();
  }

  void saveNewSens() {
    //actualizar los valores de sensibilidad, la llamada a la funcion de verificar rango de sliders se hace desde el archivo de la pantalla
  }
}
