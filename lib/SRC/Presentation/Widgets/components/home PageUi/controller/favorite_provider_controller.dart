import 'package:flutter/cupertino.dart';

class FavoriteProviderController with ChangeNotifier {
  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;

  void favorite() {
    _isFavorite = !isFavorite;
    notifyListeners();
  }
}
