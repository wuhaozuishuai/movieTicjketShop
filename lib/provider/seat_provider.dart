import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/seat_model.dart';
import 'dart:convert';
import 'package:flutter_shop/service/service_method.dart';

class SeatP with ChangeNotifier {
  List<Seat_provider> _goodsList = [];

  // String _movieId = '1';
  String _allList = '请选择';

  List<Map> _seatList = [];
  List<Map> _choseList = [];
  Double priceCount;
  bool a = true;
  initP(String id) async {
    var data;
    // _movieId = id?id:_movieId;
    await myGetRequest('http://49.234.103.109:18080/selectThisEMovieSeat' +
            '?movieId=' +
            id)
        .then((value) {
      data = json.decode(value.toString());
      _allList = data['data']['name'];
      _seatList = (data['data']['seatData'] as List).cast();
    });
    // print(_seatList);
    notifyListeners();
  }

  addChose(Map li) {
    _choseList.add(li);

    notifyListeners();
  }

  deleteChose(int index) {
    //传入suoyin
    _choseList.removeAt(index);
    notifyListeners();
  }

  deleteChoseById(String index) {
    //传入id

    Map obj = {};
    _choseList.forEach((element) {
      if (element['seatid'] == index) {
        obj = element;
        print('33');
      }
    });
    _choseList.remove(obj);
    notifyListeners();
  }

  emptyChose() {
    _choseList = [];
    notifyListeners();
  }

  List<Seat_provider> get goodsList => _goodsList;

  set goodsList(List<Seat_provider> value) {
    _goodsList = value;
  }

  // increment() {
  //   notifyListeners();
  // }

  //选择或取消座位
  choseSeat(String id) {
    this._seatList.forEach((element) {
      if (element['seatId'] == id) {
        if (element['status'] == 0) {
          element['status'] = 1;
        } else {
          element['status'] = 0;
        }
      }
    });
  }

  get allList => _allList;
  get seatList => _seatList;
  get choseList => _choseList;
}
