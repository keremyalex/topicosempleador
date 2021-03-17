import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePick {
  File _image;
  final picker = ImagePicker();

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      this._image = File(pickedFile.path);
      return this._image;
    } else {
      print('No image selected.');
    }
  }
}
