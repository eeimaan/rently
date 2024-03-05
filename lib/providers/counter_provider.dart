import 'package:flutter/material.dart';

class BedroomProvider extends ChangeNotifier {
  int _bedroomCount = 1;

  int get bedroomCount => _bedroomCount;

  void incrementBedroom() {
    _bedroomCount++;
    notifyListeners();
  }

  void decrementBedroom() {
    if (_bedroomCount > 1) {
      _bedroomCount--;
      notifyListeners();
    }
  }
}

class BathroomProvider extends ChangeNotifier {
  int _bathroomCount = 1;

  int get bathroomCount => _bathroomCount;

  void incrementBathroom() {
    _bathroomCount++;
    notifyListeners();
  }

  void decrementBathroom() {
    if (_bathroomCount > 1) {
      _bathroomCount--;
      notifyListeners();
    }
  }
}

class DrawingRoomProvider extends ChangeNotifier {
  int _drawingroomCount = 1;

  int get drawingroomCount => _drawingroomCount;

  void incrementdrawingroom() {
    _drawingroomCount++;
    notifyListeners();
  }

  void decrementdrawingroom() {
    if (_drawingroomCount > 1) {
      _drawingroomCount--;
      notifyListeners();
    }
  }
}

class TvlaunchProvider extends ChangeNotifier {
  int _tvlaunchroomCount = 1;

  int get tvlaunchRoomCount => _tvlaunchroomCount;

  void incrementtvlaunchroom() {
    _tvlaunchroomCount++;
    notifyListeners();
  }

  void decrementtvlaunchroom() {
    if (_tvlaunchroomCount > 1) {
      _tvlaunchroomCount--;
      notifyListeners();
    }
  }
}
