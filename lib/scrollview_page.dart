import 'package:flutter/material.dart';

class CustomScrollViewRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("CustomScrollView 控件"),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(  //SliverAppBar 作为头图控件
              title: Text("CustomScrollView 控件"),
              floating: true, //设置悬浮样式
              flexibleSpace: Image.network("https://pic.616pic.com/bg_w1180/00/14/86/YCnYPJmxlf.jpg!/fw/1120"), //设置悬浮头图背景
              expandedHeight: 150, //头图控件高度
            ),
            SliverList( //SliverList 作为列表控件
                delegate: SliverChildBuilderDelegate(
                        (context,index) => ListTile(title: Text("Item $index"),), //列表项创建方法
                    childCount: 100
                ))
          ],
        )
    );
  }
}