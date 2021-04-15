//选座
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/seat_provider.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/pages/seat_view.dart';
import 'package:flutter_shop/pages/column_l_i.dart';

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
        // leading: new IconButton(
        //   icon: new Icon(Icons.arrow_back_ios),
        //   onPressed: () => {
        //     // Navigator.of(context).pop()
        //     },
        // ),
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
            bottomIntro()
          ],
        ),
      )),
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
        margin: EdgeInsets.only(top: 90),
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
                  print('11');
                },
              ),
            )
          ],
        ));
  }
}
