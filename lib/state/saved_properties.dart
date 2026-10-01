import 'package:flutter/material.dart';
import '../models/property.dart';

class SavedProperties extends ChangeNotifier {
  final List<Property> _saved = [];

  List<Property> get saved => _saved;

  bool isSaved(Property property) => _saved.any((p) => p.id == property.id);

  void toggle(Property property) {
    if (isSaved(property)) {
      _saved.removeWhere((p) => p.id == property.id);
    } else {
      _saved.add(property);
    }
    notifyListeners();
  }
}

