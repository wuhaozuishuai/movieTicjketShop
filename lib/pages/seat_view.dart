import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/seat_provider.dart';
import 'package:flutter_screenutil/screenutil.dart';

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
    List<Map> _list = Provider.of<SeatP>(context).seatList;
    return Container(
      width: ScreenUtil().setWidth(700),
      height: ScreenUtil().setHeight(ScreenUtil.screenHeight),
      // margin: EdgeInsets.only(left: 40),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10, crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print('点击');
            },
            child: Icon(
                IconData(0xe613, fontFamily: 'appIconFonts'),
              size: ScreenUtil().setSp(50),
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
