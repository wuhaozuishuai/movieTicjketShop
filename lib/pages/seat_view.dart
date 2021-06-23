// import 'dart:developer';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/seat_provider.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_shop/provider/user_info_provider.dart';
import 'package:flutter_shop/pages/login_page.dart';

class SeatView extends StatefulWidget {
  @override
  _SeatViewState createState() => _SeatViewState();
}

class _SeatViewState extends State<SeatView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map> _list = Provider.of<SeatP>(context, listen: false).seatList;
    // print(_list);
    return Container(
      width: ScreenUtil().setWidth(700),
      height: ScreenUtil().setHeight(800),
      // margin: EdgeInsets.only(left: 40),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10, crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return LikeButton(
            size: 30,
            likeBuilder: (bool isLiked) {
              if (_list[index]['userId'] != null) {
                return Icon(
                  IconData(0xe613, fontFamily: 'appIconFonts'),
                  color: Colors.redAccent,
                  size: 30,
                );
              }

              return Icon(
                IconData(0xe613, fontFamily: 'appIconFonts'),
                color: isLiked ? Colors.redAccent : Colors.grey,
                size: 30,
              );
            },
            onTap: (bool isLiked) async {
              /// send your request here
              // final bool success= await sendRequest();
              //
              /// if failed, you can do nothing
              // return success? !isLiked:isLiked;
              //

              if (Provider.of<UserInfoP>(context, listen: false)
                  .userInfoList
                  .isEmpty) {
                Fluttertoast.showToast(
                    msg: "请登录后再试",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0);
                return Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => RootPage(),
                    //TextScreen()用于展示我们想要通过搜索到达的页面，
                    //这里用到了构造函数传值。
                  ),
                );
              } else {
                if (_list[index]['userId'] != null) {
                  Fluttertoast.showToast(
                      msg: "有人啦",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  print('you人');
                  return isLiked;
                }
                if (isLiked == false) {
                  Provider.of<SeatP>(context, listen: false)
                      .addChose(_list[index]);
                  print(Provider.of<SeatP>(context, listen: false).choseList);
                  print('1');
                } else {
                  // String index = _list[index]
                  Provider.of<SeatP>(context, listen: false)
                      .deleteChoseById(_list[index]['seatid']);
                  print('2');
                }

                // print(Provider.of<SeatP>(context, listen: false).choseList);
                // String i = 'dsfs';
                // i = i + 'sda0';
                // print(!isLiked);
                await Future.delayed(Duration(milliseconds: 300));
                return !isLiked;
              }
            },
          );
        },
      ),
    );
  }

  // Future<bool> onLikeButtonTapped(bool isLiked) async {
  //   /// send your request here
  //   // final bool success= await sendRequest();

  //   /// if failed, you can do nothing
  //   // return success? !isLiked:isLiked;
  //   print('123');
  //   return !isLiked;
  // }
}

// class MemberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Map userInfoList =
//         Provider.of<UserInfoP>(context, listen: false).userInfoList;
//
//     print(userInfoList);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//       ),
//       body: Center(
//         child: Container(
//           width: double.infinity,
//           height: ScreenUtil().setHeight(1200),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: ScreenUtil().setHeight(250),
//                 color: Color.fromRGBO(240, 60, 55, 1),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       ///圆角矩形
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(200)),
//                         child: Image.asset(
//                           "assets/images/logo.jpg",
//                           height: 100,
//                           width: 100,
//                         ),
//                       ),
//                       padding: EdgeInsets.only(left: 14),
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(left: 15, top: 50),
//                         child: InkWell(
//                           child: Text(
//                             userInfoList.isEmpty
//                                 ? '立即登录'
//                                 : '欢迎您,' +
//                                 userInfoList["userInfo"][0]["username"],
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: ScreenUtil().setSp(40)),
//                           ),
//                           onTap: () {
//                             if (userInfoList.isEmpty) {
//                               Navigator.push(
//                                 context,
//                                 new MaterialPageRoute(
//                                   builder: (context) => RootPage(),
//                                   //TextScreen()用于展示我们想要通过搜索到达的页面，
//                                   //这里用到了构造函数传值。
//                                 ),
//                               );
//                             }
//                           },
//                         ))
//                   ],
//                 ),
//               ),
//               Container(
//                 child: memberMain(),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
