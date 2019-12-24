//flutter中 Container组件的使用相当于div
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'firstApp',
//       home: Scaffold(
//         appBar: AppBar(title: Text('firstApp'),),
//         body: Center(child: 
//           Container(
//             child: new Text('天下第一天下第一',style: TextStyle(fontSize: 19,color: Colors.black),),
//             alignment: Alignment.center,
//             width: 200,
//             height: 200,
//             padding: const EdgeInsets.all(10),
//             decoration: new BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [Colors.lightBlue,Colors.green,Colors.purple]
//               ),
//               border: Border.all(width: 1,color: Colors.red)
//             )
//           ),),)
//     );
//   }
// }

//flutter中Image组件
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'firstApp',
//       home: Scaffold(
//         appBar: AppBar(title: Text('firstApp'),),
//         body: Center(child: 
//           Container(
//             child: new Image.asset(
//               'images/1.jpg',
//               fit: BoxFit.contain,
//               color: Colors.green,
//               colorBlendMode: BlendMode.modulate,
//             ),
//             width: 300,
//             height: 400,
//             color: Colors.lightBlue,
//           ),),)
//     );
//   }
// }

//flutter LIst组件(动态参数使用方法)
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp(
//   items: new List<String>.generate(10, (i)=>'item $i')
// ));

// class MyApp extends StatelessWidget {
//   final List<String> items;
//   MyApp({Key key,@required this.items}):super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'firstApp',
//       home: Scaffold(
//         appBar: AppBar(title: Text('firstApp'),backgroundColor: Colors.red,),
//         body: new ListView.builder(
//           itemCount: 10,
//           itemBuilder: (context,index){
//             return new ListTile(
//               title: new Text('${items[index]}'),
//             );
//           },
//         )
//       )
//     );
//   }
// }

//flutter GridView组件
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'firstApp',
//       home: Scaffold(
//         appBar: AppBar(title: Text('firstApp'),backgroundColor: Colors.red,),
//         body: GridView(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             mainAxisSpacing: 1.0,
//             crossAxisSpacing: 1.0,
//             childAspectRatio: 1
//           ),
//           children: <Widget>[
//             new Image.asset('images/1.jpg'),
//             new Image.asset('images/1.jpg'),
//             new Image.asset('images/1.jpg'),
//             new Image.asset('images/1.jpg'),
//             new Image.asset('images/1.jpg'),
//             new Image.asset('images/1.jpg')
//           ],
//         )
//       ),
//     );
//   }
// }

//flutter 布局Row
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'firstApp',
//       home: Scaffold(
//         appBar: AppBar(title: Text('firstApp'),backgroundColor: Colors.red,),
//         body: new Row(
//           children: <Widget> [
//             Expanded(child: 
//               new RaisedButton(
//                 onPressed: (){},
//                 color: Colors.lightBlue,
//                 child: new Text('蓝色按钮'),
//               )
//             ,),
//             Expanded(child: 
//               new RaisedButton(
//                 onPressed: (){},
//                 color: Colors.redAccent,
//                 child: new Text('红色按钮'),
//               )
//             ,),
//             Expanded(child: 
//               new RaisedButton(
//                 onPressed: (){},
//                 color: Colors.orangeAccent,
//                 child: new Text('橙色按钮'),
//               )
//             ,)
//           ]
//         )
//       ),
//     );
//   }
// }

//flutter 布局Colum
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'firstApp',
//       home: Scaffold(
//         appBar: AppBar(title: Text('firstApp'),backgroundColor: Colors.greenAccent,),
//         body: Center(child: Column(children: <Widget>[
//           Text('flutter'),
//           Text('make at 2019-12-22')
//         ],),)
//       ),
//     );
//   }
// }

//flutter 布局Stack
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'firstApp',home: Scaffold(
//       appBar: AppBar(title: Text('firstApp'),backgroundColor: Colors.green,),
//       body: Center(child: 
//         Stack(
//           //FractionalOffset调整横轴数轴比例
//           alignment: const FractionalOffset(1, 0.1),
//           children: <Widget>[
//           new CircleAvatar(
//             backgroundImage: new AssetImage('images/1.jpg'),
//             radius: 100,
//           ),
//           new Container(
//             decoration: new BoxDecoration(
//               color: Colors.orangeAccent
//             ),
//             padding: const EdgeInsets.all(5),
//             child: Text('天下第一'),
//           )
//         ],),
//       ),
//     ),);
//   }
// }

//flutter 布局Positioned
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'firstApp',home: Scaffold(
//       appBar: AppBar(title: Text('firstApp'),backgroundColor: Colors.greenAccent,),
//       body: Center(child: 
//         Stack(
//           //FractionalOffset调整横轴数轴比例
//           alignment: const FractionalOffset(1, 0.1),
//           children: <Widget>[
//           new CircleAvatar(
//             backgroundImage: new AssetImage('images/1.jpg'),
//             radius: 100,
//           ),
//           new Positioned(
//             top: 20,
//             left: 10,
//             child: new Container(
//               decoration: new BoxDecoration(
//                 color: Colors.orangeAccent
//               ),
//               padding: const EdgeInsets.all(5),
//               child: Text('DK必胜'),
//             ),
//           ),
//           new Positioned(
//             top: 20,
//             right: 10,
//             child: new Container(
//               decoration: new BoxDecoration(
//                 color: Colors.lightBlue
//               ),
//               padding: const EdgeInsets.all(5),
//               child: Text('天下第一'),
//             ),
//           )
//         ],),
//       ),
//     ),);
//   }
// }

//flutter 布局Card
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'firstApp',home: Scaffold(
//       appBar: AppBar(title: Text('firstApp'),backgroundColor: Colors.greenAccent,),
//       body: Card(
//         //卡片阴影
//         elevation: 15,
//         //卡片圆角
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
//         child: Column(children: <Widget>[
//         new ListTile(
//           title: Text('外星人',style: TextStyle(fontWeight: FontWeight.w500),),
//           subtitle: Text('111'),
//           leading: new Icon(Icons.wifi,color: Colors.lightBlue),
//         ),
//         new Divider(),
//         new ListTile(
//           title: Text('火星人',style: TextStyle(fontWeight: FontWeight.w500),),
//           subtitle: Text('222'),
//           leading: new Icon(Icons.wifi,color: Colors.lightBlue),
//         ),
//         new Divider(),
//         new ListTile(
//           title: Text('非洲人',style: TextStyle(fontWeight: FontWeight.w500),),
//           subtitle: Text('333'),
//           leading: new Icon(Icons.wifi,color: Colors.lightBlue),
//         ),
//         new Divider()
//       ],),),
//     ),);
//   }
// }

//flutter 导航(传参)
// import 'package:flutter/material.dart';

// class Product{
//   final String title;
//   final String description;
//   Product(this.title,this.description);
// }

// void main(){
//   runApp(MaterialApp(
//     title: '商品列表',
//     home: ProductList(
//       products: List.generate(20, (i)=>Product('商品 $i','商品详情:编号$i'))
//     )
//   ));
// }

// class ProductList extends StatelessWidget{
//   final List<Product> products;
//   ProductList({Key key,@required this.products}):super(key:key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('商品列表'),backgroundColor: Colors.greenAccent),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context,index){
//           return ListTile(
//             title: Text(products[index].title),
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail(productNo:products[index])));
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class ProductDetail extends StatelessWidget{
//   final Product productNo;
//   ProductDetail({Key key,@required this.productNo}):super(key:key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('${productNo.title}'),backgroundColor: Colors.redAccent,),
//       body: Center(child: Text(
//         '${productNo.description}'
//       )),
//     );
//   }
// }

//flutter 路由子页面带参到父页面
// import 'dart:async';
// import 'package:flutter/material.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: FirScreen(),
//       ),
//     );
//   }
// }

// class FirScreen extends StatefulWidget {
//   @override
//   _FirScreenState createState() => _FirScreenState();
// }

// class _FirScreenState extends State<FirScreen> {
//   String text2;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('父页面'),backgroundColor: Colors.orangeAccent,),
//         body: Center(child: Column(children: <Widget>[
//           Text(this.text2!=null?this.text2:'没拿到参数'),
//           RaisedButton(
//             child: Text('给子页面传111'),
//             onPressed: () async{
//               var result2 = await Navigator.push(context, MaterialPageRoute(builder: (context)=>DiaoJi(text:'111')));
//               setState(() {
//                 this.text2 = result2;
//               });
//             },
//           )
//         ],),),
//       ),
//     );
//   }
// }

// class DiaoJi extends StatelessWidget {
//   final String text;
//   DiaoJi({Key key,@required this.text}):super(key:key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('子页面'),backgroundColor: Colors.orangeAccent,),
//       body: Center(child: Column(children: <Widget>[
//         Text(this.text!=null?this.text:'没收到参数'),
//         RaisedButton(
//           child: Text('返回给父页面222'),
//           onPressed: (){
//             Navigator.pop(context,'222')
// ;          },
//         )
//       ],),),
//     );
//   }
// }

//flutter HTTP请求
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP练习',
      home: Scaffold(
        body: ProductList(),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List Data = [];
  @override
  void initState() { 
    super.initState();
    _initData();
  }
  //初始化
  _initData() async {
    var url = 'http://a.itying.com/api/productlist';
    http.Response result = await http.get(url);
    if(result!=null) {
      setState(() {
        this.Data = json.decode(result.body)['result'];
      });
    }else {
      print('请求出错');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('商品列表'),backgroundColor: Colors.greenAccent,),
        body: this.Data.length>0?Card(
          elevation: 15,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
          child: ListView.builder(
            itemCount: this.Data.length,
            itemBuilder: (context,index){
              return new ListTile(
                title: new Text('${this.Data[index]["title"]}'),
                onTap: (){
                  if(Data[index]["list"].length>0) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(products:Data[index]["list"])));
                  }else{
                    //弹出弹框
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: new Text("提示"),
                          content: new Text("无更多菜品"),
                          actions: <Widget>[
                            new FlatButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: new Text("确定"))
                          ],
                        );
                      },
                    );
                  }
                }
              );
            },
          ),
        ):Center(child: Text('加载中。。。。'),),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final List products;
  ProductDetail({Key key,@required this.products}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('${products[0]["catename"]}'),),
      body: Card(
        elevation: 15,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text('选择类目: ${products[0]["catename"]}'),
            Text('菜名: ${products[0]["title"]}'),
            Text('价格: ${products[0]["price"]}'),
            new Image.network('http://a.itying.com/${products[0]["img_url"]}',width: 200,height: 200,fit: BoxFit.cover,),
            RaisedButton(
              child: Text('返回'),
              color: Colors.lightBlue,
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],),
        ),
      ),
    ),);
  }
}