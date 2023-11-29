// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:insuline_calculator/classes/permission_gallery.dart';
import 'package:insuline_calculator/classes/permission_camera.dart';
import 'package:insuline_calculator/providers/storage_provider.dart';
import 'package:insuline_calculator/screens/main_screen.dart';
import 'package:insuline_calculator/widgets/dynamic_text_field.dart';
import 'package:insuline_calculator/widgets/register_food_widgets/dropdown_menu.dart';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class UpdateFood extends StatefulWidget {
  const UpdateFood({super.key});

  @override
  State<UpdateFood> createState() => _UpdateFoodState();
}

class _UpdateFoodState extends State<UpdateFood> {
  File? _selectedImage;
  final picker = ImagePicker();
  late final PermissionGallery _gallerymodel;
  late final PermissionCamera _cameramodel;

  @override
  void initState() {
    super.initState();
    _gallerymodel = PermissionGallery();
    _cameramodel = PermissionCamera();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: Provider.of<StorageProvider>(context).getAzFood(context), 
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
        _selectedImage =  Provider.of<StorageProvider>(context, listen: false).selectedImage;
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasError){
            return Center(child: Text("ERROR"));
          } else {
            //Se asigna a los controllers
            print(snapshot.data);
            return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text("Editar un alimento",
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Text field generico que acepta el controllador para leer el input
                      DynamicTextField(
                        myController:
                            Provider.of<StorageProvider>(context).controllerChangeNombre,
                        height: 45,
                        width: 280,
                        textInputType: TextInputType.multiline,
                        label: "Nombre del alimento",
                        maxlines: 1,
                        minlines: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FutureBuilder<Uint8List> (
                          future: Provider.of<StorageProvider>(context, listen: false).getFirebaseImage(Provider.of<StorageProvider>(context).imageToChange),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot2){
                            if(snapshot2.connectionState == ConnectionState.waiting){
                              return CircularProgressIndicator();
                            } else {
                              print(snapshot2.data);
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: snapshot2.hasError
                                    ? Image.asset('assets/images/not_loaded.jpg',
                                        height: 150, fit: BoxFit.contain)
                                    : (_selectedImage != null) ?
                                        Image.file(_selectedImage!,
                                        height: 150, fit: BoxFit.contain)
                                    : Image.memory(snapshot2.data!,
                                        height: 150, fit: BoxFit.contain)
                                );
                            }
                          },
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    backgroundColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5))),
                                onPressed: () {
                                  _pickImageFromCamera();
                                },
                                child: const Text('Tomar foto del alimento',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    )),
                              )),
                          SizedBox(width: 30),
                          SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    backgroundColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5))),
                                child: const Text('Agregar de galería',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontSize: 15, color: Colors.white)),
                                onPressed: () {
                                  _pickImageFromGallery();
                                },
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        child: DynamicTextField(
                            myController:
                              Provider.of<StorageProvider>(context).controllerChangeDescripcion,
                            height: 95,
                            width: 300,
                            textInputType: TextInputType.multiline,
                            label: "Descripción del alimento",
                            maxlines: 3,
                            minlines: 3),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 125,
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text("Tamaño porción"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: DynamicTextField(
                                        myController:
                                          Provider.of<StorageProvider>(context).controllerChangePorcion,
                                        height: 60,
                                        width: 120,
                                        textInputType: TextInputType.number,
                                        label: "Cantidad",
                                        maxlines: 1,
                                        minlines: 1),
                                  ),
                                ]),
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(
                                height: 125,
                                child: Column(children: [
                                  Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Text("Unidad alimento"),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: DropdownMenuExample()),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text("Carbs"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: DynamicTextField(
                                    myController:
                                      Provider.of<StorageProvider>(context).controllerChangeCarbs,
                                    height: 60,
                                    width: 120,
                                    textInputType: TextInputType.number,
                                    label: "Cantidad",
                                    maxlines: 1,
                                    minlines: 1),
                              ),
                            ],
                          )
                        ],
                      ),

                      SizedBox(
                          width: 140,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              Provider.of<StorageProvider>(context, listen: false)
                                  .editAzFodItem(context);
                              setState(() {
                                Navigator.pushReplacement(context, 
                                  MaterialPageRoute(builder: (BuildContext context) => const MainScreen())
                                );
                              });
                            },
                            child: const Text('Actualizar',
                                style: TextStyle(fontSize: 15, color: Colors.white)),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
          }
        }
    );
  }

  //Revisar los permisos y si se tienen, abrir la galería para seleccionar imagen
  Future _pickImageFromGallery() async {
    final hasGalleryPermission = await _gallerymodel.requestPermission();

    if (hasGalleryPermission) {
      XFile? returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 30);

      if (returnedImage == null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "No se eligió imagen",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
      } else {
        Provider.of<StorageProvider>(context, listen: false).selectedImage =
            File(returnedImage.path);
        setState(() {
          Provider.of<StorageProvider>(context, listen: false).imageWasChanged();
          _selectedImage = null;
          
        });
      }
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "No se tiene permiso para abrir la galería",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      //Si esta como permanente el no poder usar los files, te manda a los settings
      if (_gallerymodel.imageSection ==
          ImageSection.noStoragePermissionPermanent) {
        openAppSettings();
      }
    }
  }

  //Revisar los permisos y si se tienen, abrir la cámara para tomar una foto del alimento
  Future _pickImageFromCamera() async {
    final hasCameraPermission = await _cameramodel.requestPermission();

    if (hasCameraPermission) {
      XFile? returnedImage =
          await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 30);

      if (returnedImage == null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "No se eligió imagen",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
      } else {
        Provider.of<StorageProvider>(context, listen: false).selectedImage =
            File(returnedImage.path);
        setState(() {
          _selectedImage = null;
          Provider.of<StorageProvider>(context, listen: false).imageWasChanged();
          print("Change");
        });
      }
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "No se tiene permiso para usar la cámara",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      //Si esta como permanente el no poder usar la camara, te manda a los settings
      if (_cameramodel.cameraSection ==
          CameraSection.noCameraPermissionPermanent) {
        openAppSettings();
      }
    }
  }
}
