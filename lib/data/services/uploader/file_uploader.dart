import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FileUploader {
  static Future<String> imageUploader(XFile xFile, String fileName) async {
    String downloadUrl = "";
    final storageRef = FirebaseStorage.instance.ref();
    var imageRef = storageRef.child("images/$fileName/${xFile.name}");
    await imageRef.putFile(File(xFile.path));
    downloadUrl = await imageRef.getDownloadURL();
    return downloadUrl;
  }
}
