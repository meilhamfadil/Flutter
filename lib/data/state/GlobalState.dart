import 'package:flutter/cupertino.dart';

class GlobalState extends ChangeNotifier {
  bool isRequesting = false;

  void setRequesting(bool requesting) {
    isRequesting = requesting;
    notifyListeners();
  }
}
