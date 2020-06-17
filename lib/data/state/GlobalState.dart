import 'package:flutter/cupertino.dart';

class GlobalState extends ChangeNotifier{

  bool _isRequesting = false;

  void setRequesting(bool requesting){
    _isRequesting = requesting;
    notifyListeners();
  }

}