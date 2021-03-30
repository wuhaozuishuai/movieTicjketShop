import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './pages/index_page.dart';
import 'package:provider/provider.dart';
import './provider/counter.dart';
import './provider/child_category.dart';
import './provider/category_goods_list.dart';
import './provider/seat_provider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/routers/routers.dart';
import 'package:flutter_shop/pages/login_page.dart';
import 'package:flutter_shop/provider/user_info_provider.dart';

void main() {
  //单个状态管理
  // runApp(ChangeNotifierProvider<Counter>.value(
  //   value:Counter(0),
  //   child: MyApp(),
  // )
  // );

  debugPaintSizeEnabled = !true;
  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider<ChildCategory>.value(value: ChildCategory()),
      ChangeNotifierProvider<Counter>.value(value: Counter(0)),
      ChangeNotifierProvider<CategoryGoodsListProvider>.value(
          value: CategoryGoodsListProvider()),
      ChangeNotifierProvider<SeatP>.value(value: SeatP()),
      ChangeNotifierProvider<UserInfoP>.value(value: UserInfoP())
      // Provider<Counter>(create: (_)=>Counter(0))
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO 路由参数
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    // 初始化传入宽高
    return Container(
      child: MaterialApp(
        onGenerateRoute: Application.router.generator,
        title: 'fly电影',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color.fromRGBO(240, 60, 55, 1)),
        home: IndexPage(),
        // home: RootPage(),
      ),
    );
  }
}
