import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/sensibility_widgets/forms.dart';

class SliderProvider with ChangeNotifier{
  List<Ranges> _rangosGlucosa = [Ranges(0, 23)];
  List<Ranges> _rangosCarbohidratos = [Ranges(0, 23)];

  List<Ranges> get rangosGlucosa => _rangosGlucosa;
  List<Ranges> get rangosCarbohidratos => _rangosCarbohidratos;

  void agregarRangoGlucosa(Ranges rango){
    _rangosGlucosa.add(rango);
    //print(_rangosGlucosa.length);
    //print(rangosGlucosa.length);
    notifyListeners();
  }

  void agregarRangoCarbohidratos(Ranges rango){
    _rangosCarbohidratos.add(rango);
    //print(_rangosCarbohidratos.length);
    //print(rangosCarbohidratos.length);
    notifyListeners();
  }

  bool isOverlap(int endTime, int nextStartTime) {
    return  nextStartTime < endTime;
  }

  bool rangoValidoGlucosa() {
    if(_rangosGlucosa.length == 1){
      return true;
    } else {
      _rangosGlucosa.sort((a,b) => a.start.compareTo(b.start));
      for(int i=0; i<_rangosGlucosa.length -1; i++){
        Ranges current = _rangosGlucosa[i];
        Ranges next = _rangosGlucosa[i+1];
        if(isOverlap(current.end, next.start)){
          return false;
        }
      }
      return true;
    }
  }

  bool rangoValidoCarbohidratos() {
    if(_rangosCarbohidratos.length == 1){
      return true;
    } else {
      {
      _rangosCarbohidratos.sort((a,b) => a.start.compareTo(b.start));
      for(int i=0; i<_rangosCarbohidratos.length -1; i++){
        Ranges current = _rangosCarbohidratos[i];
        Ranges next = _rangosCarbohidratos[i+1];
        if(isOverlap(current.end, next.start)){
          return false;
        }
      }
      return true;
    }
    }
  }
  
  bool rangoValidoSliders(){
    print(rangoValidoCarbohidratos() && rangoValidoGlucosa());
    return rangoValidoCarbohidratos() && rangoValidoGlucosa();
  }

}