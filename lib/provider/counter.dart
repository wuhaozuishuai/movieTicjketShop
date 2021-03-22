import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int _value ;
  // var _height;
  // var _width;
  Counter(this._value);


  increment(){
    _value++;
    notifyListeners();
  }
  get value => _value;

  // get height => _height;
  // get width => _width;
}