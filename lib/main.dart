import 'package:flutter/material.dart';
import 'package:myfirstflutter/tiproute_page.dart';
import 'package:myfirstflutter/image_route.dart' deferred as image_page;
import 'package:myfirstflutter/constraints_page.dart' deferred as constraints_page;
import 'package:myfirstflutter/linear_page.dart' deferred as linear_page;
import 'package:myfirstflutter/richtext_page.dart' deferred as richtext_page;
import 'package:myfirstflutter/button_page.dart' deferred as button_page;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //应用首页路由，home 为 Flutter 应用的首页，它也是一个 widget
      home: const MyHomePage(key: Key("10086"), title: 'Flutter Demo 主页'),
      routes: routers,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}) : num = 10;

  final String title;
  final int num;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //初始化状态
    print("initState");
  }

  void _incrementCounter() {
    setState(() { //会触发 build
      _counter++;
      print("count：$_counter");

      ShoppingCart.withCode(name: '张丹', code: '123456')
        ..bookings = [Item('apple', 10.0), Item('peach', 15.0)]
        ..printInfo();

      ShoppingCart(name: '李章')
        ..bookings = [Item('apple', 10.0), Item('peach', 45.0)]
        ..printInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    var routeLists = routers.keys.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         '初始值是 ${widget.num}，让你点，你点啊:',
      //       ),
      //       Text(
      //         "${_counter + widget.num}",
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //       TextButton(onPressed: () {
      //         Navigator.push(context, MaterialPageRoute(builder: (context) {
      //           // return NewRoute();
      //           // return RouterTestRoute();
      //           return ContainerAsyncRouterPage(image_page.loadLibrary(), (context) {
      //             return image_page.ImageAndIconRoute();
      //           });
      //         }));
      //       },
      //           child: Text("跳转新的页面")),
      //     ],
      //   ),
      // ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: new Text(routers.keys.toList()[index]),
                ),
              ),
            );
          },
          itemCount: routers.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '点击计数',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Meta {
  double price;
  String name;

  Meta(this.name, this.price);
}

//定义商品类
class Item extends Meta {
  Item(name, price) : super(name, price);

  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

mixin PrintHelper {
  printInfo() => print(getInfo());

  getInfo();
}

class ShoppingCart extends Meta with PrintHelper {
  DateTime date;
  String? code;
  List<Item> bookings = [];

  ShoppingCart({name}) : this.withCode(name: name, code: null);

  ShoppingCart.withCode({name, this.code})
      : this.date = DateTime.now(),
        super(name, 0);

  double get price =>
      bookings.reduce((value, element) => value + element).price;

  @override
  getInfo() {
    return '''
    购物车信息：
    -----------------------------
    用户名：$name
    优惠码：${code ?? "没有"}
    总价：$price
    Date：$date
    -----------------------------
    ''';
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class ContainerAsyncRouterPage extends StatelessWidget {
  final Future libraryFuture;

  ///不能直接传widget，因为 release 打包时 dart2js 优化会导致时许不对
  ///稍后更新文章到掘金
  final WidgetBuilder child;

  ContainerAsyncRouterPage(this.libraryFuture, this.child);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: libraryFuture,
        builder: (c, s) {
          if (s.connectionState == ConnectionState.done) {
            if (s.hasError) {
              return Scaffold(
                appBar: AppBar(),
                body: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Error: ${s.error}',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            }
            return child.call(context);
          }
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

//路由表，value 是一个回调函数，用于生成相应的路由 Widget
Map<String, WidgetBuilder> routers = {
  "home": (context) => MyHomePage(title: "Flutter Demo"),
  "最简单的 Route": (context) {
    return NewRoute();
  },
  "内部有跳转的 Route": (context) {
    return RouterTestRoute();
  },
  "image 组件": (context) {
    return ContainerAsyncRouterPage(image_page.loadLibrary(), (context) {
      return image_page.ImageAndIconRoute();
    });
  },
  "constraints 组件": (context) {
    return ContainerAsyncRouterPage(constraints_page.loadLibrary(), (context) {
      return constraints_page.ConstrainedBoxRoute();
    });
  },
  "线性组件": (context) {
    return ContainerAsyncRouterPage(linear_page.loadLibrary(), (context) {
      return linear_page.LinearRoute();
    });
  },
  "富文本": (context) {
    return ContainerAsyncRouterPage(richtext_page.loadLibrary(), (context) {
      return richtext_page.RichTextRoute();
    });
  },
  "按钮": (context) {
    return ContainerAsyncRouterPage(button_page.loadLibrary(), (context) {
      return button_page.ButtonRoute();
    });
  },
};
