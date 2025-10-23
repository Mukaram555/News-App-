import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class EmailVisibilityProvider with ChangeNotifier {
  bool _show = false;

  bool get show => _show;

  String? emailvalid(String? value) {
    if (value == null || value.isEmpty) {
      updateState(false);
      return 'Email is Required !';
    } else if (value != 'info@gmail.com') {
      updateState(true);
      return '! invailed Email';
    } else if (value == '@' || value == '.') {
      updateState(true);
      return '! invailed Email';
    }
    updateState(false);
    return null;
  }

  void updateState(bool val) {
    _show = val;
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}

class PasswordVisibilityProvider with ChangeNotifier {
  String? passwordvalid(String? value) {
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      notifyListeners();
    });
    if (value == null || value.isEmpty) {
      return 'Password is Required !';
    } else if (value != '1234') {
      return '! invailed Password';
    }
    return null;
  }

  String? waitpasswordvalid(String? value) {
    return null;
  }

  bool _isVisibility = true;

  bool get isVisibility => _isVisibility;

  void Show() {
    _isVisibility = !_isVisibility;
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}

class ConfermPasswordVisibilityProvider with ChangeNotifier {
  bool _isVisibility = true;

  bool get isVisibility => _isVisibility;

  void Show() {
    _isVisibility = !_isVisibility;
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}
