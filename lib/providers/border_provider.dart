import 'package:flutter/material.dart';
import 'package:rent_fix/constants/constants.dart';

class SelectedBorderProvider with ChangeNotifier {
  Color _container1Color = Colors.transparent;
  Color _container2Color = Colors.transparent;
  Color _container3Color = Colors.transparent;

  Color _container4Color = Colors.transparent;
  Color _container5Color = Colors.transparent;
  Color _container6Color = Colors.transparent;
  Color _container7Color = Colors.transparent;

  Color _container8Color = Colors.transparent;
  Color _container9Color = Colors.transparent;
  Color _container10Color = Colors.transparent;

  Color get container1Color => _container1Color;
  Color get container2Color => _container2Color;
  Color get container3Color => _container3Color;

  Color get container4Color => _container4Color;
  Color get container5Color => _container5Color;
  Color get container6Color => _container6Color;
  Color get container7Color => _container7Color;
  Color get container8Color => _container8Color;
  Color get container9Color => _container9Color;
  Color get container10Color => _container10Color;

  void updateContainer1Color(BuildContext context) {
    _container1Color = _container1Color == Colors.transparent
        ? AppColors.turquoise
        : Colors.transparent;
    notifyListeners();
  }

  void updateContainer2Color(BuildContext context) {
    _container2Color = _container2Color == Colors.transparent
        ? AppColors.turquoise
        : Colors.transparent;
    notifyListeners();
  }

  void updateContainer3Color(BuildContext context) {
    _container3Color = _container3Color == Colors.transparent
        ? AppColors.turquoise
        : Colors.transparent;
    notifyListeners();
  }

  void updateContainer4Color(BuildContext context) {
    _container4Color = _container3Color == Colors.transparent
        ? AppColors.turquoise
        : Colors.transparent;
    notifyListeners();
  }

  void updateContainer5Color(BuildContext context) {
    _container5Color = _container3Color == Colors.transparent
        ? AppColors.turquoise
        : Colors.transparent;
    notifyListeners();
  }

  void updateContainer6Color(BuildContext context) {
    _container6Color = _container3Color == Colors.transparent
        ? AppColors.turquoise
        : Colors.transparent;
    notifyListeners();
  }

  void updateContainer7Color(BuildContext context) {
    _container7Color = _container3Color == Colors.transparent
        ? AppColors.turquoise
        : Colors.transparent;
    notifyListeners();
  }

  void updateContainer8Color(BuildContext context) {
    _container8Color = _container3Color == Colors.transparent
        ? AppColors.turquoise
        : Colors.transparent;
    notifyListeners();
  }

  void updateContainer9Color(BuildContext context) {
    _container9Color = _container3Color == Colors.transparent
        ? AppColors.turquoise
        : Colors.transparent;
    notifyListeners();
  }

  void updateContainer10Color(BuildContext context) {
    _container10Color = _container3Color == Colors.transparent
        ? AppColors.turquoise
        : Colors.transparent;
    notifyListeners();
  }
}
