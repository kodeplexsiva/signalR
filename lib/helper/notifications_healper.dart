import 'package:flutter/material.dart';
import 'package:warehouse/data/Selection_data.dart';

class SingleNotifier extends ChangeNotifier {
  String _currentWarehouse = warehouses[0];
  String _currentSection = Sections[0];
  String _currentStoreType = StoreTypes[0];

  SingleNotifier();

  String get currentWarehouse => _currentWarehouse;
  String get currentSection => _currentSection;
  String get currentStoreType => _currentStoreType;


  updateWarehouse(String value) {
    if (value != _currentWarehouse){
      _currentWarehouse = value;
      notifyListeners();
    }
  }

  updateSection(String value) {
    if (value != _currentSection){
      _currentSection = value;
      notifyListeners();
    }
  }

  updateStoreType(String value) {
    if (value != _currentStoreType){
      _currentStoreType = value;
      notifyListeners();
    }
  }
}