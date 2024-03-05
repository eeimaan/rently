import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rent_fix/constants/constants.dart';

class AppUtils {
  static Future<List<String>> getImagesFromGallery() async {
    final pickedFiles = await ImagePicker().pickMultiImage(imageQuality: 100);

    if (pickedFiles.isNotEmpty) {
      List<String> imagePaths = pickedFiles.map((pickedFile) {
        File image = File(pickedFile.path);
        return image.path;
      }).toList();

      return imagePaths;
    } else {
      return [];
    }
  }

  static Future<List<String>> getImagesFromCamera() async {
    final pickedFiles = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);

    if (pickedFiles != null) {
      File image = File(pickedFiles.path);
      return [image.path];
    } else {
      return [];
    }
  }

  static String formatDateWithoutTime(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }


   static void showCircularIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
          child: CupertinoActivityIndicator(
        color: AppColors.turquoise,
      )),
    );
  }

  static void hideCircularIndicator(BuildContext context) {
    Navigator.of(context).pop();
  }
}
