import 'package:flutter/material.dart';

/**
 * 第三个页面
 */
class TipRoute extends StatelessWidget {
  TipRoute({
    key,
    required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "你好"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * 第二个页面
 */
class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("我是第二个页面"),
        ElevatedButton(
          onPressed: () async {
            // 打开`TipRoute`，并等待返回结果
            var result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TipRoute(
                    // 路由参数
                    text: "我是 TipRoute 页面",
                  );
                },
              ),
            );
            //输出`TipRoute`路由返回结果
            print("路由返回值: $result");
          },
          child: Text("进入提示页"),
        ),
      ],
    );
  }
}
