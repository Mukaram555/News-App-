import 'package:flutter/foundation.dart';

class ThemeProvider with ChangeNotifier {
  bool _light = false;

  bool get light => _light;

  void toggleTheme() {
    _light = !_light;
    notifyListeners();
  }
}
