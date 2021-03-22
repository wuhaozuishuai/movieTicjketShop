import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'TextScreen.dart';

class MovieBar extends StatelessWidget {
  List<Map> msg;
  final int index;
  MovieBar(this.msg,this.index);

  @override
  Widget build(BuildContext context) {
    // print("============单个组合");
    // print(msg);
    return Container(
        width: ScreenUtil().setWidth(150),
        margin: EdgeInsets.only(right: 20,top: 10),
        child: Column(
          children: [
            picW(msg[index]['image']),
            _title(msg[index]['title']),
            _scroe(msg[index]['score']),
            _button(context,msg[index])
          ],
        ),
    );
  }
  Widget picW(src){
    return InkWell(
        child: Container(
          width: ScreenUtil().setWidth(280),
          height: ScreenUtil().setHeight(200),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(src),
                fit: BoxFit.cover,
              )
          ),
        ),
      onTap: (){
      },
    );
  }
  Widget _title(String title){
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black,
        fontSize: ScreenUtil().setSp(24),
      ),
    );
  }
  //分数
  Widget _scroe(String scroe){
    return Text(
      "评分：${scroe}",
      style: TextStyle(
        color: Colors.black26,
        fontSize: ScreenUtil().setSp(20),
      ),
    );
  }
  // 购片按钮
  Widget _button(context,msg){

    return SizedBox(
      width: ScreenUtil().setWidth(130),
      height: ScreenUtil().setHeight(50),
      child:  FlatButton (
        child: Text(
          '查看',
        ),
        color: Color.fromRGBO(240, 60, 55, 1 ),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        onPressed: (){
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) =>  TextScreen(data: msg),
              //TextScreen()用于展示我们想要通过搜索到达的页面，
              //这里用到了构造函数传值。
            ),
          );
            print('++++点击了购买');
            // print(msg);
        },
      ),
    );

  }
}


