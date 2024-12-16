import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<dynamic> loadImageLocal(nameImg_) async {
  final ImagePicker picker = ImagePicker();
  try {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String path_ = await saveImage(File(pickedFile.path), nameImg_);
      return path_;
    }
    return null;
  } catch (e) {
    print("Error picking image: $e");
  }
}

Future<String> saveImage(File image, String nameImg_) async {
  final directory = await getApplicationDocumentsDirectory();
  final String path = '${directory.path}/${nameImg_}';
  await image.copy(path);
  return path;
}


Future<String> loadUrlImage() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}


