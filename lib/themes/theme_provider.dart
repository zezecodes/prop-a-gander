import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeToggle = ChangeNotifierProvider((ref) => AppTheme());

class AppTheme extends ChangeNotifier {
  bool lightModeEnable = true;
  void setLightMode() {
    lightModeEnable = true;
    notifyListeners();
  }

  void setDarkMode() {
    lightModeEnable = false;
    notifyListeners();
  }

  void toggleMode() {
    lightModeEnable = !lightModeEnable;
    notifyListeners();
  }
}
