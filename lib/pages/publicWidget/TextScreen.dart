//TODO 电影详情页面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/pages/publicWidget/textLimitDisplay.dart';
import 'package:like_button/like_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_shop/pages/cart_dart.dart';
import 'package:provider/provider.dart';
import '../../provider/seat_provider.dart';

class TextScreen extends StatelessWidget {
  Map data;
  final String s;
  TextScreen({Key key, @required this.s, @required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(data);
    // Use the Todo to create our UI
    return new Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('电影'),
            flexibleSpace: Container(
                decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.redAccent,
                Colors.redAccent,
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ))),
        body: Center(
          child: movieBody(
            thisMovie: data,
          ),
        ));
  }
}

//TODO 电影详情布局
class movieBody extends StatelessWidget {
  Map thisMovie = {};
  movieBody({this.thisMovie});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(200, 200, 200, 0.8),
            Color.fromRGBO(200, 200, 200, 0.8),
            // Color.fromRGBO(41, 165, 227, 0.8),
          ],
        ),
      ),
      child: Column(
        children: [
          header(thisMovie),
          introduce(thisMovie),
          Spacer(),
          bottomButton(thisMovie['id'], context)
        ],
      ),
    );
  }

  //TODO 头部
  Widget header(_data) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            width: ScreenUtil().setWidth(280),
            height: ScreenUtil().setHeight(430),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(_data['image']),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
              margin: EdgeInsets.only(left: 20),
              height: ScreenUtil().setHeight(380),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _data['title'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(40),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Text(
                    _data['englishName'],
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: ScreenUtil().setSp(24),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(80)),
                  Text('${_data['time']} 上映',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: ScreenUtil().setSp(24),
                        fontWeight: FontWeight.w600,
                      )),
                  decorateButton()
                ],
              ))
        ],
      ),
    );
  }

  //  TODO 装饰按钮
  Widget decorateButton() {
    return Container(
        width: ScreenUtil().setWidth(430),
        margin: EdgeInsets.only(top: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlatButton(
              child: Container(
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(60),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(192, 192, 192, 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //设置四周边框
                    // border: new Border.all(width: 1,),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LikeButton(),
                      Text(
                        '想看',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Colors.white),
                      )
                    ],
                  )),
              onPressed: () {
                print('喜欢');
              },
            ),
            FlatButton(
              child: Container(
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(60),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(192, 192, 192, 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //设置四周边框
                    // border: new Border.all(width: 1,),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LikeButton(
                        size: 30,
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.home,
                            color:
                                isLiked ? Colors.deepPurpleAccent : Colors.grey,
                            size: 30,
                          );
                        },
                      ),
                      Text(
                        '看过',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Colors.white),
                      )
                    ],
                  )),
              onPressed: () {
                print('看过');
              },
            ),
          ],
        ));
  }

  //TODO 介绍
  Widget introduce(_data) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '简介:',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(40),
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
          TextLimitDisplay(
            text: _data['description'],
            minLines: 3, // 收起状态下最大展示行数
            maxLines: 6, // 展开后最大展示行数限制
            textStyle: TextStyle(
              color: Colors.white60,
              // fontWeight: FontWeight.w600,
              fontSize: ScreenUtil().setSp(25),
            ),
          ),
        ],
      ),
    );
  }

  //TODO  底部按钮
  Widget bottomButton(id, context) {
    return Container(
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
                child: Text('特惠购票'),
                color: Colors.redAccent,
                // padding: EdgeInsets.symmetric(horizontal: 8),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {
                  Provider.of<SeatP>(context, listen: false).initP(id);
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => CartPage(),
                      //TextScreen()用于展示我们想要通过搜索到达的页面，
                      //这里用到了构造函数传值。
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
