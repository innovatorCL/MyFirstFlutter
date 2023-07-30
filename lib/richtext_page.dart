import 'package:flutter/material.dart';

class RichTextRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextStyle blackStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black); //黑色样式

    TextStyle redStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red); //红色样式

    return Scaffold(
      appBar: AppBar(
        title: Text("Row、Column"),
      ),
      // body: Text(
      //   '文本是视图系统中的常见控件，用来显示一段特定样式的字符串，就比如Android里的TextView，或是iOS中的UILabel。',
      //   textAlign: TextAlign.center,//居中显示
      //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),//20号红色粗体展示
      // )
      body : Text.rich(
        TextSpan(
            children: <TextSpan>[
              TextSpan(text:'文本是视图系统中常见的控件，它用来显示一段特定样式的字符串，类似', style: redStyle), //第1个片段，红色样式
              TextSpan(text:'Android', style: blackStyle), //第1个片段，黑色样式
              TextSpan(text:'中的', style:redStyle), //第1个片段，红色样式
              TextSpan(text:'TextView', style: blackStyle), //第1个片段，黑色样式
              TextSpan(text:'嘿嘿嘿', style: redStyle) //第1个片段，黑色样式
            ]),
        textAlign: TextAlign.center,
      )
    );
  }
}