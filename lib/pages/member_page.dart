//会员中心页面
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/user_info_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/login_page.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> with SingleTickerProviderStateMixin {


  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Map userInfoList =
        Provider.of<UserInfoP>(context, listen: false).userInfoList;

    print(userInfoList);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: ScreenUtil().setHeight(1200),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: ScreenUtil().setHeight(250),
                color: Color.fromRGBO(240, 60, 55, 1),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      ///圆角矩形
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        child: Image.asset(
                          "assets/images/logo.jpg",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      padding: EdgeInsets.only(left: 14),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 15, top: 50),
                        child: InkWell(
                          child: Text(
                            userInfoList.isEmpty
                                ? '立即登录'
                                : '欢迎您,' +
                                userInfoList["userInfo"][0]["username"],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(40)),
                          ),
                          onTap: () {
                            if (userInfoList.isEmpty) {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => RootPage(),
                                  //TextScreen()用于展示我们想要通过搜索到达的页面，
                                  //这里用到了构造函数传值。
                                ),
                              );
                            }
                          },
                        ))
                  ],
                ),
              ),
              Container(
                child: memberMain(),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class memberMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: ScreenUtil().setHeight(50),
            width: double.infinity,
            padding: EdgeInsets.only(left: 220),
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black38, width: 2)),
            ),
            child: Text(
              '我的电影票',
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            ),
          ),
          // ticketList()
        ],
      ),
    );
  }
}

// class ticketList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Map _userInfoList =
//         Provider.of<UserInfoP>(context, listen: false).userInfoList;
//     int length = 1;
//     if (!_userInfoList.isEmpty) {
//       length = _userInfoList["seatInfo"].length == 0
//           ? 1
//           : _userInfoList["seatInfo"].length;
//     }
//     return Container(
//         height: ScreenUtil().setHeight(500),
//         child: ListView.builder(
//           itemCount: length,
//           itemBuilder: (context, index) {
//             Widget a = Text(_userInfoList.toString());
//             if (!_userInfoList.isEmpty) {
//               // debugger();
//               if (_userInfoList["seatInfo"].length == 0) {
//                 // a = Text(
//                 //     Provider.of<UserInfoP>(context, listen: false).textMsg);
//                 return Container(
//                   child: a,
//                 );
//               } else {
//                 a = Text('12');
//                 return Text('123');
//               }
//             }
//             return a;
//           },
//         ));
//   }
// }





// child: Column(
//       children: [
//         Text('${Provider.of<Counter>(context).value}'),
//         Text('高度：${ScreenUtil.screenHeightPx.toString()}'),
//         Text('高度：${ScreenUtil.screenHeight.toString()}'),
//         Text('宽度：${ScreenUtil.screenWidthPx.toString()}'),
//         Text('宽度：${ScreenUtil.screenWidth.toString()}'),
//         Text('像素密度：${ScreenUtil.pixelRatio.toString()}'),
//         Text('底部安全区距离：${ScreenUtil.bottomBarHeight.toString()}'),
//         Text('状态栏高度：${ScreenUtil.statusBarHeight.toString()}'),
//         Text('实际宽度设计稿宽度的比例：${ScreenUtil().scaleWidth.toString()}'),
//         Text('实际高度与设计稿高度度的比例：${ScreenUtil().scaleHeight.toString()}'),
//         Text('asddd：${MediaQuery.of(context).size}'),
//         Text('asddd：${window.physicalSize}'),
//         Text('${Provider.of<UserInfoP>(context).userInfoList}')
//       ],
//     )
