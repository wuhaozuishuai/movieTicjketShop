//TODO 选座页面列数条
import 'package:flutter/material.dart';

class ColumnLI extends StatelessWidget {
  List _list = [1,2,3,4,5,6,7,8,9,10];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context,index){
          return Text(_list[index]);
        },
      )
    );
  }
}
