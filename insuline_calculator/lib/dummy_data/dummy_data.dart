import 'package:insuline_calculator/classes/food.dart';
import 'package:insuline_calculator/classes/food_detail.dart';
import 'package:insuline_calculator/classes/bolus.dart';

Food zucaritas = Food(
    title: 'zucaritas',
    unit: 'g',
    baseServingSize: 30,
    basecarbs: 27,
    description:
        'cereal epic tigre con una descripcion bien enorme enorme enorme enorme enorme enorme enorme enorme enorme',
    imageUrl:
        'https://static.wixstatic.com/media/b1e0a5_909bf52097c142fe98cbfa7e39a5934e~mv2.jpg/v1/fill/w_980,h_980,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/b1e0a5_909bf52097c142fe98cbfa7e39a5934e~mv2.jpg');

Food tacos = Food(
    title: 'tacos',
    unit: 'units',
    baseServingSize: 1,
    basecarbs: 24,
    description: 'taquito epic',
    imageUrl:
        'https://cdn7.kiwilimon.com/brightcove/8631/640x640/8631.jpg.webp');

Food manzana = Food(
    title: 'Manzana',
    unit: 'units',
    baseServingSize: 1,
    basecarbs: 20,
    description: 'manzana roja epic',
    imageUrl:
        'https://www.recetasnestle.com.mx/sites/default/files/inline-images/tipos-de-manzana-royal-gala.jpg');

var dummyFood = [manzana, tacos, zucaritas];

var dummyFoodDetail = [
  FoodDetail(alimento: zucaritas, quantity: 50.0),
  FoodDetail(alimento: tacos, quantity: 3.0),
  FoodDetail(alimento: manzana, quantity: 2.0)
];

Bolus boloEpic = Bolus(foodList: dummyFoodDetail);
