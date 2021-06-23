import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';

//启动页
class SpalashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SpalashState();
  }
}

class _SpalashState extends State<SpalashPage> {
  Timer _countTimer;
  int _countDown = 6;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/bg_kyzg_login2.png",
            fit: BoxFit.fill,
          ),
          Positioned(
            // 定位组件，将倒计时定位到右上角
            child: Container(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "$_countDown",
                    style: TextStyle(color: Colors.black),
                  ),
                ]),
              ),
              //装饰器
              decoration: BoxDecoration(
                color: Colors.grey[350],
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(45),
                ),
              ),
              padding: EdgeInsets.all(15),
            ),
            top: 30,
            right: 30,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startCountDown();
  }

//倒计时
  void _startCountDown() {
    _countTimer = Timer.periodic(
      Duration(seconds: 1), //刷新频率
      (timer) {
        setState(() {
          if (_countDown < 1) {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => IndexPage(),
                //TextScreen()用于展示我们想要通过搜索到达的页面，
                //这里用到了构造函数传值。
              ),
            );
            _countTimer.cancel();
            _countTimer = null;
          } else {
            _countDown -= 1; //计数器减1
          }
        });
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _countTimer.cancel();
    _countDown = 0;
  }
}
