import 'package:flutter/material.dart';

class ImagePickerProvider extends ChangeNotifier {
  List<String> _imagePaths = [];

  List<String> get paths => _imagePaths;

  set setPaths(List<String> paths) {
    _imagePaths = paths;
    notifyListeners();
  }

  void addPaths(List<String> paths) {
    _imagePaths.addAll(paths);
    notifyListeners();
  }

  void removeImage(String path) {
    _imagePaths.remove(path);
    notifyListeners();
  }
}
