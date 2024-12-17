import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:typed_data';

Future<dynamic> loadImageLocal() async {
  final ImagePicker picker = ImagePicker();

  try {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      Uint8List bytes = file.readAsBytesSync();
      String encode_ = base64Encode(bytes);
      // print(encode_);

      // print(base64Decode(encode_));
      // String path_ = await saveImage(File(pickedFile.path), nameImg_);
      return [true,Image.memory(base64Decode(encode_)),encode_];
    }
    return [false,false];
  } catch (e) {
    print("Error picking image: $e");
    return [false,false];
  }
}

// Future<String> saveImage(File image, String nameImg_) async {
//   final directory = await getApplicationDocumentsDirectory();
//   final String path = '${directory.path}/${nameImg_}';
//   await image.copy(path);
//   return path;
// }

// Future<String> loadUrlImage() async {
//   final directory = await getApplicationDocumentsDirectory();
//   return directory.path;
// }
