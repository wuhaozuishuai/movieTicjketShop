//TODO 全部电影
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_shop/pages/publicWidget/TextScreen.dart';
//TODO 分类页面
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('所有电影')),
        body: FutureBuilder(
            future: myRequest('selectAllMovie'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                List<Map> swiper = (data['data']['ImgData'] as List).cast();
                List<Map> movieList = (data['data']['listData'] as List).cast();

                // print('+++++++++请求全部电影');
                // print(movieList);
                return Container(
                  child: Column(
                    children: [
                      SwiperDiy(swperDateList: swiper),
                      rowBar(),
                      Container(
                        height: ScreenUtil().setHeight(760),
                        margin: EdgeInsets.only(left: 20),
                        child: movieListWidget(movieList),
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text('加载中'),
                );
              }
            }));
  }

  //TODO 今日票房
  Widget rowBar() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(700),
      height: ScreenUtil().setHeight(50),
      color: Color.fromRGBO(246, 246, 246, 1),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.chart_bar_alt_fill,
            color: Colors.black54,
            size: 30,
          ),
          Text(
            '实时票房',
            style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil().setSp(24),
                fontWeight: FontWeight.w700),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
                style: TextStyle(fontSize: ScreenUtil().setSp(24)),
                children: <InlineSpan>[
                  TextSpan(text: '今日大盘', style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: '2251.6万',
                      style: TextStyle(color: Color.fromRGBO(240, 60, 55, 1))),
                ]),
          ),
        ],
      ),
    );
  }

  //TODO 电影列表
  Widget movieListWidget(_list) {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(205),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(_list[index]['image']),
                        fit: BoxFit.cover,
                      )),
                ),
                // Image.network(_list[index]['image'],height: ScreenUtil().setHeight(200),),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: ScreenUtil().setHeight(200),
                  width: ScreenUtil().setWidth(450),
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Text(
                          _list[index]['title'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(30)
                        ),

                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(style: TextStyle(), children: [
                          TextSpan(
                              text: 'fly评分 ',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                  color: Color.fromRGBO(100, 100, 100, 1))),
                          TextSpan(
                              text: _list[index]['score'],
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Color.fromRGBO(255, 179, 0, 1)))
                        ]),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '主 演: ${_list[index]['actor']}',
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Flexible()
                    ],
                  ),
                ),
                Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: SizedBox(
                    width:ScreenUtil().setWidth(130),
                    child: FlatButton(
                      color: Color.fromRGBO(240, 60, 55, 1),
                      child: Text('购票'),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      onPressed: (){

                      },
                    ),
                  )
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) =>  TextScreen(data: _list[index]),
                //TextScreen()用于展示我们想要通过搜索到达的页面，
                //这里用到了构造函数传值。
              ),
            );
          },
        );
      },
    );
  }

  // //TODO 每个电影右侧组件

}

//TODO 轮播组件
class SwiperDiy extends StatelessWidget {
  final List swperDateList;
  //构造函数
  SwiperDiy({this.swperDateList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(230),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        //swiper构造器
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "${swperDateList[index]['image']}",
            fit: BoxFit.cover,
          );
        },
        itemCount: 4,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
