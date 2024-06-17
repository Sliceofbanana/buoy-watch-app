import 'package:flutter/material.dart';

class WeatherProvider with ChangeNotifier {
  String _condition = "safe"; // Can be 'safe', 'moderate', 'alert'
  String _status = "GREEN ALERT";
  String get condition => _condition;
  String get status => _status;

  void updateWeather(String newCondition, String newStatus) {
    _condition = newCondition;
    _status = newStatus;
    notifyListeners();
  }
}
