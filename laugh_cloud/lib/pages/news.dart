//新闻页面
import 'package:flutter/material.dart';
import 'package:laugh_cloud/pages/login.dart';
import 'news/game.dart';
import 'news/international.dart';
import 'news/technology.dart';
import 'news/fashion.dart';
import 'news/finance.dart';
import 'package:share/share.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: <Widget> [
            GestureDetector(child: Icon(Icons.share),onTap: () {
              Share.share('【笑云安卓版】\n https://github.com/a85115695/flutter');
            },)
          ],
          leading: new IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()))
            },
          ),
          title: Text('新闻',style: TextStyle(color: Colors.black),),
          bottom: TabBar(
            labelStyle: TextStyle(
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.w200
            ),
            isScrollable: true,
            tabs: <Widget>[
              GestureDetector(child: Tab(text: '游戏'),),
              GestureDetector(child: Tab(text: '国际'),),
              GestureDetector(child: Tab(text: '科技'),),
              GestureDetector(child: Tab(text: '时尚'),),
              GestureDetector(child: Tab(text: '财经'),),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          GameScreen(),
          InternationalScreen(),
          TechnologyScreen(),
          FashionScreen(),
          FinanceScreen(),
        ],),
      ),
    );
  }
}