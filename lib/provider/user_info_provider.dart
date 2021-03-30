import 'package:flutter/material.dart';
import '../model/user_info_model.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'dart:convert';

class UserInfoP with ChangeNotifier {
  Map _userInfoList = {};
  String _textMsg = '';
  userLogin(int id) async {
    await myGetRequest('http://49.234.103.109:18080/selectUser' + '?id=${id}')
        .then((value) {
      var _data = json.decode(value.toString());
      _userInfoList = _data['data'];
      print(_userInfoList);
      // if (_userInfoList["seatInfo"].length == 0) {
      //   _textMsg = '暂无数据';
      // }
    });
    notifyListeners();
  }

  // getMoreList(List<UserInfoModel> list) {
  //   // _userInfoList.addAll(list);
  //   notifyListeners();
  // }

  get userInfoList => _userInfoList;
  // get textMsg => _textMsg;
}
