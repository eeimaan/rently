import 'package:flutter/material.dart';

class PropertyProvider extends ChangeNotifier {
  late String propertType;
  late String agreement;
  late String name;
  late String address;
  late String postCode;
  late String blockNo;
  late String floor;
  late String unit;
  late String appartmentSize;
  late String bedroom;
  late String bathroom;
  late String drawingroom;
  late String tvroom;
  late String furnishing;
  late String rent;
  late String description;
  late String avaliableDate;
  List<String> listPhotos = [];

  set setPropertyType(String value) {
    propertType = value;
    notifyListeners();
  }

  String get getPropertyType {
    return propertType;
  }

  set setAgreement(String value) {
    agreement = value;
    notifyListeners();
  }

  String get getAgreement {
    return agreement;
  }

  set setAddress(String value) {
    address = value;
    notifyListeners();
  }

  String get getAddress {
    return address;
  }

  set setName(String value) {
    name = value;
    notifyListeners();
  }

  String get getName {
    return name;
  }

  set setPostCode(String value) {
    postCode = value;
    notifyListeners();
  }

  String get getPostCode {
    return postCode;
  }

  set setBlockNo(String value) {
    blockNo = value;
    notifyListeners();
  }

  String get getBlockNo {
    return blockNo;
  }

  set setFloor(String value) {
    floor = value;
    notifyListeners();
  }

  String get getFloor {
    return floor;
  }

  set setUnit(String value) {
    unit = value;
    notifyListeners();
  }

  String get getUnit {
    return unit;
  }

  set setAppartmentSize(String value) {
    appartmentSize = value;
    notifyListeners();
  }

  String get getAppartmentSize {
    return appartmentSize;
  }

  set setBedroom(String value) {
    bedroom = value;
    notifyListeners();
  }

  String get getBedroom {
    return bedroom;
  }

  set setBathroom(String value) {
    bathroom = value;
    notifyListeners();
  }

  String get getBathroom {
    return bathroom;
  }

  set setdrawingroom(String value) {
    drawingroom = value;
    notifyListeners();
  }

  String get getdrawingroom {
    return drawingroom;
  }

  set settvroom(String value) {
    tvroom = value;
    notifyListeners();
  }

  String get gettvroom {
    return tvroom;
  }

  set setFurnishing(String value) {
    furnishing = value;
    notifyListeners();
  }

  String get getFurnishing {
    return furnishing;
  }

  set setRent(String value) {
    rent = value;
    notifyListeners();
  }

  String get getRent {
    return rent;
  }

  set setDescription(String value) {
    description = value;
    notifyListeners();
  }

  String get getDescription {
    return description;
  }

  set setAvaliableDate(String value) {
    avaliableDate = value;
    notifyListeners();
  }

  String get getAvaliableDate {
    return avaliableDate;
  }

  set setListPhotos(List<String> value) {
    listPhotos = value;
    notifyListeners();
  }

  List<String> get getListPhotos {
    return listPhotos;
  }
}
