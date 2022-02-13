import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// to pick the images....
pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    //we can also use code as:-
    // return File(_file.path); which needs"import dart:io" (dart:io is not supported for web version)..
    // we we're using :-
    print(" Img selected");
    return await _file
        .readAsBytes(); // this requires type of Uint8list file...(in auth_method.dart)
  }
  print("No img selected");
}

///to show the snackbar...
showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}
