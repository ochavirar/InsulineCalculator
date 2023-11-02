import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

enum CameraSection{
  noCameraPermission,
  noCameraPermissionPermanent,
  useCamera,
  imageLoaded,
}

class PermissionCamera extends ChangeNotifier {
  CameraSection _cameraSection = CameraSection.useCamera;
  CameraSection get cameraSection => _cameraSection;
  XFile? file;
 
  set cameraSection(CameraSection value){
    if ( value != _cameraSection){
      _cameraSection = value;
      notifyListeners();
    }
  }

  Future<bool> requestPermission() async {
    PermissionStatus result;
    result = await Permission.camera.request();


    if (result.isGranted) {
      cameraSection = CameraSection.useCamera;
      return true;
    } else if (Platform.isIOS || result.isPermanentlyDenied){
      cameraSection = CameraSection.noCameraPermissionPermanent;
    } else {
      cameraSection = CameraSection.noCameraPermission;
    }

    return false;
  }

  Future<void> pickFile() async {
    XFile? result = await ImagePicker().pickImage(source: ImageSource.camera);
    if ( result != null){
      file = result;
      cameraSection = CameraSection.imageLoaded;
    }
  }

  

}