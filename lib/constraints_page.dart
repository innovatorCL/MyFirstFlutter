import 'package:flutter/material.dart';

class ConstrainedBoxRoute extends StatelessWidget {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("ConstrainedBox、SizeBox"),
        ),
        // body: ConstrainedBox(
        //   constraints: BoxConstraints(
        //     minWidth: double.infinity, //宽度尽可能大
        //     minHeight: 50.0, //最小高度为50像素
        //     maxHeight: 80.0, //最大高度为 80 像素
        //   ),
        //   child: Container(
        //     height: 50.0,
        //     child: redBox,
        //   ),
        // )
        body: SizedBox(width: 80,height: 80,child: redBox),
    );
  }
}
