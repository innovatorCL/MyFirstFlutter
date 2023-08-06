import 'package:flutter/material.dart';

class ButtonRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Button 控件"),
      ),
      body: Column(
        //测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //根据文本宽度自适应
          FloatingActionButton.extended(onPressed: () => print('FloatingActionButton pressed'),label: Text('FloatingActionButton'),),
          TextButton(onPressed: () => print('TextButton pressed'),child: Text('TextButton'),),
          ElevatedButton(onPressed: () => print("ElevatedButton pressed"), child: Text('ElevatedButton'))
        ],
      )
    );
  }
}