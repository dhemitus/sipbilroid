import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static DecorationImage imageNetwork(String url, {BoxFit? fit, ColorFilter? filter}) {
    return DecorationImage(image: NetworkImage(url), fit: fit ?? BoxFit.cover, colorFilter: filter);
  }

  static DecorationImage imageAsset(String url, {BoxFit? fit, ColorFilter? filter}) {
    return DecorationImage(image: AssetImage(url), fit: fit ?? BoxFit.cover, colorFilter: filter);
  }

  static DecorationImage imageFile(File file, {BoxFit? fit, ColorFilter? filter}) {
    return DecorationImage(image: FileImage(file), fit: fit ?? BoxFit.cover, colorFilter: filter);
  }

  static Future<File>load() async {
    ImagePicker _picker = ImagePicker();
    File? _picture;

    PickedFile? _file = await _picker.getImage(source: ImageSource.camera);

    _file != null ? _picture = File(_file.path) : null;

    return _picture!;
  }

}
