import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:insuline_calculator/classes/az_food_list.dart';

class StorageProvider with ChangeNotifier{
  List<AZFoodListItem> _listFood = []; //Lista que contendrá los alimentos dados de alta en la aplicación
  final _controllerNombre= TextEditingController();
  final _controllerDescripcion= TextEditingController();
  final _controllerPorcion= TextEditingController();
  final _controllerCarbs= TextEditingController();

  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

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
        User user = _auth.currentUser!;
        String mailID = user.email ?? 'error';
        if(selectedImage != null){
          final storageRef = _storage.ref();
          storageRef.child("food${selectedImage!.path}").putFile(selectedImage!);
        }

        final foodFire = <String, dynamic>{
          "carbos": int.parse(_controllerCarbs.text),
          "descripcion": _controllerDescripcion.text,
          "email": mailID,
          "imagen": selectedImage == null? "food/null/not_loaded.jpg" : "food${selectedImage!.path}",
          "nombre": _controllerNombre.text,
          "porcion": int.parse(_controllerPorcion.text),
          "unidad": selectedUnit,
        };

        String documentName = _controllerNombre.text.replaceAll(RegExp(r'\s+'), '_');
        
        _firestore.collection("alimento").doc('${mailID}_$documentName').set(foodFire);
        clearFoodForm();
        notifyListeners();

      }catch(e){
        print(e);
        callErrorSnackbar("Error al añadir alimento a la base de datos", context);
      }
    }
  }

  Future<void> getAzListFood(BuildContext context) async{

    var userFood =  await _firestore.collection("alimento")
    .where('email', isEqualTo: _auth.currentUser!.email)
    .get();
    _listFood = [];
    userFood.docs.forEach((element) {
      var azfood = AZFoodListItem(
        tag: element["nombre"][0], 
        title: element["nombre"],
        unit: element["unidad"],
        baseServingSize: element["porcion"],
        basecarbs:  element["carbos"],
        description: element["descripcion"],
        imageUrl: element["imagen"]);
      
      _listFood.add(azfood);
    });

  }

  Future<void> deleteAzListFoodItem(BuildContext context,int index,  String name, String path) async {
    try{
      String documentName = name.replaceAll(RegExp(r'\s+'), '_');
      _firestore.collection("alimento")
      .doc('${_auth.currentUser!.email}_$documentName')
      .delete()
      .then((value) async {
        print(path);
        if(path != 'food/null/not_loaded.jpg'){
          final storageRef = _storage.refFromURL('gs://calculadorainsulina.appspot.com');
          var imageRef = storageRef.child(path);
          await imageRef.delete();
        }
        _listFood.removeWhere((obj) => obj.title == name);
      });
    } catch (e) {
      print(e);
      callErrorSnackbar("No se pudo eliminar el alimento de la lista", context);
    }
  }

  Future<Uint8List> getFirebaseImage(String path) async {
    final storageRef = _storage.refFromURL('gs://calculadorainsulina.appspot.com');
    var imageRef = storageRef.child(path);
    const res = 1024 * 1024;
    print(imageRef);
    Uint8List? data = await imageRef.getData(res);
    if (data == null){
      var imageRef = storageRef.child("food/null/not_loaded.jpg");
      data = await imageRef.getData(res);
      return data!;
    }
    return data;
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