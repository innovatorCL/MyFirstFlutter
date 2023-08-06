import 'package:flutter/material.dart';

class ListViewRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView 控件"),
      ),
      body: ListView.separated(itemCount : 100,
          // itemExtent : 50, //列表项高度
          itemBuilder: (BuildContext context, int index) => ListTile(title: Text("title $index"),subtitle: Text("subtitle $index"),), separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? Divider(color: Colors.green) : Divider(color: Colors.pink);
        },)
    );
  }
}