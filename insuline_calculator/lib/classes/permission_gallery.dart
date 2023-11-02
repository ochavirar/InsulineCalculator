import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

enum ImageSection{
  noStoragePermission,
  noStoragePermissionPermanent,
  browseFiles,
  imageLoaded,
}

class PermissionGallery extends ChangeNotifier {
  ImageSection _imageSection = ImageSection.browseFiles;
  ImageSection get imageSection => _imageSection;
  XFile? file;
 
  set imageSection(ImageSection value){
    if ( value != _imageSection){
      _imageSection = value;
      notifyListeners();
    }
  }

  Future<bool> requestPermission() async {
    PermissionStatus result;
    if (Platform.isAndroid){
      result = await Permission.storage.request();
    } else {
      result = await Permission.photos.request();
    }

    if (result.isGranted) {
      imageSection = ImageSection.browseFiles;
      return true;
    } else if (Platform.isIOS || result.isPermanentlyDenied){
      imageSection = ImageSection.noStoragePermissionPermanent;
    } else {
      imageSection = ImageSection.noStoragePermission;
    }

    return false;
  }

  Future<void> pickFile() async {
    XFile? result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if ( result != null){
      file = result;
      imageSection = ImageSection.imageLoaded;
    }
  }

  

}