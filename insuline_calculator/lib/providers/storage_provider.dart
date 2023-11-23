import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insuline_calculator/classes/az_food_list.dart';

class StorageProvider with ChangeNotifier{
  List<AZFoodListItem> _listFood = []; //Lista que contendrá los alimentos dados de alta en la aplicación
  final _controllerNombre= TextEditingController();
  final _controllerDescripcion= TextEditingController();
  final _controllerPorcion= TextEditingController();
  final _controllerCarbs= TextEditingController();

  final _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String selectedUnit = "g";
  File? selectedImage;


  List<AZFoodListItem> get listFood => _listFood;
  TextEditingController get controllerNombre=> _controllerNombre;
  TextEditingController get controllerDescripcion=> _controllerDescripcion;
  TextEditingController get controllerPorcion=> _controllerPorcion;
  TextEditingController get controllerCarbs=> _controllerCarbs;
  FirebaseFirestore get firestore => _firestore; 
  
  //Verificamos que no esten vacíos los campos de texto y guardamos en la base de datos el nuevo alimento
  void saveAzListFood(BuildContext context) async{

    //Si alguno no esta lleno poner un snackbar
    if(_controllerCarbs.text.trim() == '' || _controllerDescripcion.text.trim() == ''
        || _controllerNombre.text.trim() == '' || _controllerPorcion.text.trim() == ''){
        
      callErrorSnackbar("Llena todos los campos para agregar alimento ", context);


    } else{
      try{
        var foodBox = await Hive.openBox<List>("food");
        //Crear el objeto de AzFoodItem
        var listItem = AZFoodListItem(
          tag: _controllerNombre.text[0],
          title: _controllerNombre.text,
          unit: selectedUnit,
          baseServingSize: int.parse(_controllerPorcion.text),
          basecarbs: int.parse(_controllerCarbs.text),
          description: _controllerDescripcion.text,
          imageUrl: selectedImage == null? "null" : selectedImage!.path
        );
        User user = _auth.currentUser!;
        String mailID = user.email ?? 'error';

        final foodFire = <String, dynamic>{
          "carbos": int.parse(_controllerCarbs.text),
          "descripcion": _controllerDescripcion.text,
          "email": mailID,
          "imagen": "placeholder",
          "nombre": _controllerNombre.text,
          "porcion": int.parse(_controllerPorcion.text),
          "unidad": selectedUnit,
        };
        
        firestore.collection("alimento").add(foodFire).then((DocumentReference doc) => 
          print("Documento añadido con ID: ${doc.id}"));

        _listFood.add(listItem);
        await foodBox.put("allAzFood", _listFood);
        await foodBox.close();
        clearFoodForm();
        notifyListeners();

      }catch(e){
        print(e);
        callErrorSnackbar("Error al añadir alimento a la base de datos", context);
      }
    }
  }

  Future<void> getAzListFood(BuildContext context) async{
    try {
      var foodBox = await Hive.openBox<List>("food");
      _listFood = foodBox.get('allAzFood')!.cast<AZFoodListItem>();
      await foodBox.close();
    } catch (e) {
      
    }
  }

  Future<void> deleteAzListFoodItem(BuildContext context, int index) async {
    try{
      var foodBox = await Hive.openBox<List>("food");
      _listFood = foodBox.get('allAzFood')!.cast<AZFoodListItem>();
      _listFood.removeAt(index);
      await foodBox.put("allAzFood", _listFood);
      await foodBox.close();
      notifyListeners();

    } catch (e) {
      print(e);
      callErrorSnackbar("No se pudo eliminar el alimento de la lista", context);
    }
  }

  void callErrorSnackbar(String msg, BuildContext context){
    ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(msg,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }


    
  void clearFoodForm(){
    controllerNombre.clear();
    controllerDescripcion.clear();
    controllerPorcion.clear();
    controllerCarbs.clear();
    selectedImage = null;
  }


}