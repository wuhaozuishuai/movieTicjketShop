//选座
import 'dart:convert';
// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_shop/service/service_method.dart';
import 'package:provider/provider.dart';
import '../provider/seat_provider.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/pages/seat_view.dart';
// import 'package:flutter_shop/pages/publicWidget/column_l_i.dart';
import 'package:flutter_shop/provider/user_info_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
// import 'dart:io';
// import 'package:flutter_shop/pages/login_page.dart';
// import 'package:flutter/services.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<SeatP>(context,listen: false).initP();
    List _list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () {
            Provider.of<SeatP>(context, listen: false).emptyChose();
            Navigator.of(
              context,
            ).pop();
          },
        ),
        title: Text('${Provider.of<SeatP>(context).allList}'),
      ),
      body: Center(
          child: Container(
        height: double.infinity,
        color: Color.fromRGBO(240, 240, 240, 1),
        child: Column(
          children: [
            intr(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: ScreenUtil().setHeight(750),
                    width: ScreenUtil().setWidth(60),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(100, 100, 100, 0.1),
                        border: Border.all(
                            width: 1,
                            color: Color.fromRGBO(100, 100, 100, 0.2)),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: ListView.builder(
                      itemCount: _list.length,
                      itemBuilder: (context, index) {
                        return Text(
                          _list[index].toString(),
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(45),
                              height: 1.5,
                              color: Colors.black87),
                          textAlign: TextAlign.center,
                        );
                      },
                    )),
                // ColumnLI(),

                SeatView(),
              ],
            ),
            // selectedView(),
            selectedView(),
            bottomIntro(),
          ],
        ),
      )),
    );
  }
}

class selectedView extends StatelessWidget {
  // const selectedView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = Provider.of<SeatP>(context).allList;
    List<Map> list = Provider.of<SeatP>(context).choseList;
    int pp = 0;
    list.forEach((element) {
      pp = pp + int.parse(element['price']);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          list.length == 0 ? '' : '总数：${list.length}张  总金额：${pp}',
          style: TextStyle(
              color: Color.fromRGBO(240, 60, 55, 1),
              fontSize: ScreenUtil().setSp(25)),
        ),
        Container(
          // width: ScreenUtil().setWidth(700),
          margin: EdgeInsets.only(top: 20),
          height: ScreenUtil().setHeight(200),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: 300,
                  height: 100,
                  child: Card(
                      child: Container(
                    height: 100,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.album),
                          title: Text(
                            '${name}',
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                      '${list[index]["row"]}排${list[index]["column"]}列。价格：${list[index]["price"]} ')),
                              Container(
                                child: Text('${list[index]["playTime"]}'),
                                margin: EdgeInsets.only(top: 5),
                              ),
                            ],
                          ),
                          trailing: InkWell(
                            child: Icon(Icons.close),
                            onTap: () => {
                              Provider.of<SeatP>(context, listen: false)
                                  .deleteChose(index)
                            },
                          ),
                        ),
                      ],
                    ),
                  )));
            },
          ),
        )
      ],
    );
  }
}

class intr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(500),
      height: ScreenUtil().setHeight(50),
      decoration: BoxDecoration(
          color: Color.fromRGBO(100, 100, 100, 0.5),
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(
        'fly电影院',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(25)),
      ),
    );
  }
}

//TODO 底部tab
class bottomIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(top: 47),
        width: double.infinity,
        height: ScreenUtil().setHeight(100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: ScreenUtil().setWidth(450),
              height: ScreenUtil().setHeight(80),
              child: FlatButton(
                child: Text('购票'),
                color: Colors.redAccent,
                // padding: EdgeInsets.symmetric(horizontal: 8),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {
                  if (Provider.of<SeatP>(context, listen: false)
                      .choseList
                      .isEmpty) {
                    Fluttertoast.showToast(
                        msg: "请选择座位",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    //购票
                    showDialog<Null>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text('请扫描二维码付款'),
                          content: new SingleChildScrollView(
                            child: new ListBody(
                              children: <Widget>[
                                // new Text('内容 1'),
                                //
                                Image.asset(
                                  "assets/images/pay.png",
                                  height: 400,
                                  width: 400,
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text('已付款'),
                              onPressed: () async {
                                List resq =
                                    Provider.of<SeatP>(context, listen: false)
                                        .choseList;
                                resq.forEach((element) {
                                  element["userId"] = Provider.of<UserInfoP>(
                                          context,
                                          listen: false)
                                      .userInfoList["userInfo"][0]['id'];
                                  element["forUsername"] =
                                      Provider.of<UserInfoP>(context,
                                                  listen: false)
                                              .userInfoList["userInfo"][0]
                                          ['username'];
                                  element["status"] = 1;
                                });

                                Response response;
                                response = await Dio().post(
                                    "http://49.234.103.109:18080/choseTicket",
                                    data: json.encode(resq));
                                Provider.of<SeatP>(context, listen: false)
                                    .emptyChose();
                                Provider.of<UserInfoP>(context, listen: false)
                                    .userLogin(int.parse(Provider.of<UserInfoP>(
                                            context,
                                            listen: false)
                                        .userInfoList["userInfo"][0]['id']));
                                Navigator.of(context).pop();
                                Fluttertoast.showToast(
                                    msg: "购票成功",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ));
  }
}
