import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await  _imagePicker.pickImage(source: source);

if (_file != null) {
  //we can also use code as:-
  // return File(_file.path); which needs"import dart:io" (dart:io is not supported for web version)..
  // we we're using :-
  return await _file.readAsBytes(); // this requires type of Uint8list file...(in auth_method.dart)
print(" Img selected");
}
print("No img selected");
}
