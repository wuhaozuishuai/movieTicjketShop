//会员中心页面
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/counter.dart';
import 'dart:ui';
class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('${Provider.of<Counter>(context).value}'),
            Text('高度：${ScreenUtil.screenHeightPx.toString()}'),
            Text('高度：${ScreenUtil.screenHeight.toString()}'),
            Text('宽度：${ScreenUtil.screenWidthPx.toString()}'),
            Text('宽度：${ScreenUtil.screenWidth.toString()}'),
            Text('像素密度：${ScreenUtil.pixelRatio.toString()}'),
            Text('底部安全区距离：${ScreenUtil.bottomBarHeight.toString()}'),
            Text('状态栏高度：${ScreenUtil.statusBarHeight.toString()}'),
            Text('实际宽度设计稿宽度的比例：${ScreenUtil().scaleWidth.toString()}'),
            Text('实际高度与设计稿高度度的比例：${ScreenUtil().scaleHeight.toString()}'),
            Text('asddd：${MediaQuery.of(context).size}'),
            Text('asddd：${window.physicalSize}'),
          ],
        )
      ),
    );
  }
}
