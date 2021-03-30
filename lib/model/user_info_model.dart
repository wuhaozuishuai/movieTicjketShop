/// code : 1
/// data : {"userInfo":[{"id":"1","username":"wuhao","phone":"13000000000","sex":"1","address":"地球","age":"18","movieTicket":"0"}],"seatInfo":[{"id":"1","index":"1","image":"http://p1.meituan.net/movie/20803f59291c47e1e116c11963ce019e68711.jpg@160w_220h_1e_1c","title":"霸王别姬","actor":"张国荣,张丰毅,巩俐","time":"1993-01-01(中国香港)","score":"9.6","type":"0","movieType":"1","description":"测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1","englishName":"EnglishName1","eventId":"1","forMovie":"1","playTime":"2021-05-20 10:00:00","seatId":"12","forEventId":"1","column":"2","row":"2","price":"35","status":"0","userId":"1","forUsername":null},{"id":"1","index":"1","image":"http://p1.meituan.net/movie/20803f59291c47e1e116c11963ce019e68711.jpg@160w_220h_1e_1c","title":"霸王别姬","actor":"张国荣,张丰毅,巩俐","time":"1993-01-01(中国香港)","score":"9.6","type":"0","movieType":"1","description":"测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1","englishName":"EnglishName1","eventId":"1","forMovie":"1","playTime":"2021-05-20 10:00:00","seatId":"13","forEventId":"1","column":"2","row":"3","price":"35","status":"0","userId":"1","forUsername":"wuhao"}]}
/// message : "success"

class UserInfoModel {
  int _code;
  Data _data;
  String _message;

  int get code => _code;
  Data get data => _data;
  String get message => _message;

  UserInfoModel({int code, Data data, String message}) {
    _code = code;
    _data = data;
    _message = message;
  }

  set code(int value) {
    _code = value;
  }

  UserInfoModel.fromJson(dynamic json) {
    _code = json["code"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    map["message"] = _message;
    return map;
  }

  set data(Data value) {
    _data = value;
  }

  set message(String value) {
    _message = value;
  }
}

/// userInfo : [{"id":"1","username":"wuhao","phone":"13000000000","sex":"1","address":"地球","age":"18","movieTicket":"0"}]
/// seatInfo : [{"id":"1","index":"1","image":"http://p1.meituan.net/movie/20803f59291c47e1e116c11963ce019e68711.jpg@160w_220h_1e_1c","title":"霸王别姬","actor":"张国荣,张丰毅,巩俐","time":"1993-01-01(中国香港)","score":"9.6","type":"0","movieType":"1","description":"测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1","englishName":"EnglishName1","eventId":"1","forMovie":"1","playTime":"2021-05-20 10:00:00","seatId":"12","forEventId":"1","column":"2","row":"2","price":"35","status":"0","userId":"1","forUsername":null},{"id":"1","index":"1","image":"http://p1.meituan.net/movie/20803f59291c47e1e116c11963ce019e68711.jpg@160w_220h_1e_1c","title":"霸王别姬","actor":"张国荣,张丰毅,巩俐","time":"1993-01-01(中国香港)","score":"9.6","type":"0","movieType":"1","description":"测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1","englishName":"EnglishName1","eventId":"1","forMovie":"1","playTime":"2021-05-20 10:00:00","seatId":"13","forEventId":"1","column":"2","row":"3","price":"35","status":"0","userId":"1","forUsername":"wuhao"}]

class Data {
  List<UserInfo> _userInfo;
  List<SeatInfo> _seatInfo;

  List<UserInfo> get userInfo => _userInfo;
  List<SeatInfo> get seatInfo => _seatInfo;

  Data({List<UserInfo> userInfo, List<SeatInfo> seatInfo}) {
    _userInfo = userInfo;
    _seatInfo = seatInfo;
  }

  Data.fromJson(dynamic json) {
    if (json["userInfo"] != null) {
      _userInfo = [];
      json["userInfo"].forEach((v) {
        _userInfo.add(UserInfo.fromJson(v));
      });
    }
    if (json["seatInfo"] != null) {
      _seatInfo = [];
      json["seatInfo"].forEach((v) {
        _seatInfo.add(SeatInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_userInfo != null) {
      map["userInfo"] = _userInfo.map((v) => v.toJson()).toList();
    }
    if (_seatInfo != null) {
      map["seatInfo"] = _seatInfo.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "1"
/// index : "1"
/// image : "http://p1.meituan.net/movie/20803f59291c47e1e116c11963ce019e68711.jpg@160w_220h_1e_1c"
/// title : "霸王别姬"
/// actor : "张国荣,张丰毅,巩俐"
/// time : "1993-01-01(中国香港)"
/// score : "9.6"
/// type : "0"
/// movieType : "1"
/// description : "测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1测试剧情详情1"
/// englishName : "EnglishName1"
/// eventId : "1"
/// forMovie : "1"
/// playTime : "2021-05-20 10:00:00"
/// seatId : "12"
/// forEventId : "1"
/// column : "2"
/// row : "2"
/// price : "35"
/// status : "0"
/// userId : "1"
/// forUsername : null

class SeatInfo {
  String _id;
  String _index;
  String _image;
  String _title;
  String _actor;
  String _time;
  String _score;
  String _type;
  String _movieType;
  String _description;
  String _englishName;
  String _eventId;
  String _forMovie;
  String _playTime;
  String _seatId;
  String _forEventId;
  String _column;
  String _row;
  String _price;
  String _status;
  String _userId;
  dynamic _forUsername;

  String get id => _id;
  String get index => _index;
  String get image => _image;
  String get title => _title;
  String get actor => _actor;
  String get time => _time;
  String get score => _score;
  String get type => _type;
  String get movieType => _movieType;
  String get description => _description;
  String get englishName => _englishName;
  String get eventId => _eventId;
  String get forMovie => _forMovie;
  String get playTime => _playTime;
  String get seatId => _seatId;
  String get forEventId => _forEventId;
  String get column => _column;
  String get row => _row;
  String get price => _price;
  String get status => _status;
  String get userId => _userId;
  dynamic get forUsername => _forUsername;

  SeatInfo(
      {String id,
      String index,
      String image,
      String title,
      String actor,
      String time,
      String score,
      String type,
      String movieType,
      String description,
      String englishName,
      String eventId,
      String forMovie,
      String playTime,
      String seatId,
      String forEventId,
      String column,
      String row,
      String price,
      String status,
      String userId,
      dynamic forUsername}) {
    _id = id;
    _index = index;
    _image = image;
    _title = title;
    _actor = actor;
    _time = time;
    _score = score;
    _type = type;
    _movieType = movieType;
    _description = description;
    _englishName = englishName;
    _eventId = eventId;
    _forMovie = forMovie;
    _playTime = playTime;
    _seatId = seatId;
    _forEventId = forEventId;
    _column = column;
    _row = row;
    _price = price;
    _status = status;
    _userId = userId;
    _forUsername = forUsername;
  }

  SeatInfo.fromJson(dynamic json) {
    _id = json["id"];
    _index = json["index"];
    _image = json["image"];
    _title = json["title"];
    _actor = json["actor"];
    _time = json["time"];
    _score = json["score"];
    _type = json["type"];
    _movieType = json["movieType"];
    _description = json["description"];
    _englishName = json["englishName"];
    _eventId = json["eventId"];
    _forMovie = json["forMovie"];
    _playTime = json["playTime"];
    _seatId = json["seatId"];
    _forEventId = json["forEventId"];
    _column = json["column"];
    _row = json["row"];
    _price = json["price"];
    _status = json["status"];
    _userId = json["userId"];
    _forUsername = json["forUsername"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["index"] = _index;
    map["image"] = _image;
    map["title"] = _title;
    map["actor"] = _actor;
    map["time"] = _time;
    map["score"] = _score;
    map["type"] = _type;
    map["movieType"] = _movieType;
    map["description"] = _description;
    map["englishName"] = _englishName;
    map["eventId"] = _eventId;
    map["forMovie"] = _forMovie;
    map["playTime"] = _playTime;
    map["seatId"] = _seatId;
    map["forEventId"] = _forEventId;
    map["column"] = _column;
    map["row"] = _row;
    map["price"] = _price;
    map["status"] = _status;
    map["userId"] = _userId;
    map["forUsername"] = _forUsername;
    return map;
  }
}

/// id : "1"
/// username : "wuhao"
/// phone : "13000000000"
/// sex : "1"
/// address : "地球"
/// age : "18"
/// movieTicket : "0"

class UserInfo {
  String _id;
  String _username;
  String _phone;
  String _sex;
  String _address;
  String _age;
  String _movieTicket;

  String get id => _id;
  String get username => _username;
  String get phone => _phone;
  String get sex => _sex;
  String get address => _address;
  String get age => _age;
  String get movieTicket => _movieTicket;

  UserInfo(
      {String id,
      String username,
      String phone,
      String sex,
      String address,
      String age,
      String movieTicket}) {
    _id = id;
    _username = username;
    _phone = phone;
    _sex = sex;
    _address = address;
    _age = age;
    _movieTicket = movieTicket;
  }

  UserInfo.fromJson(dynamic json) {
    _id = json["id"];
    _username = json["username"];
    _phone = json["phone"];
    _sex = json["sex"];
    _address = json["address"];
    _age = json["age"];
    _movieTicket = json["movieTicket"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["username"] = _username;
    map["phone"] = _phone;
    map["sex"] = _sex;
    map["address"] = _address;
    map["age"] = _age;
    map["movieTicket"] = _movieTicket;
    return map;
  }
}
