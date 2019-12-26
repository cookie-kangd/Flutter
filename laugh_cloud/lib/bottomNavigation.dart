//底部导航栏
import 'package:flutter/material.dart';
import 'pages/news.dart';
import 'pages/meitu.dart';
import 'pages/video.dart';
import 'pages/weather.dart';
import 'pages/mine.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final _BottomNavigationColor = Colors.black54;
  final _BottomNavigationAcColor = Colors.lightBlue;
  int _currentIndex = 0;
  List<Widget> pageList = List();
  int count = 0;
  // List bottomTitle = List();

  //初始化
  @override
  void initState() { 
    super.initState();
    pageList
      ..add(NewsScreen())
      ..add(MeituScreen())
      ..add(VideoScreen())
      ..add(WeatherScreen())
      ..add(MineScreen());
    // bottomTitle
    //   ..add('新闻')
    //   ..add('美图')
    //   ..add('视频')
    //   ..add('天气')
    //   ..add('我的');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(bottomTitle[_currentIndex]),backgroundColor: Colors.lightBlue,),
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //底部导航超过3个不显示解决办法
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: _BottomNavigationColor,
        selectedItemColor: _BottomNavigationAcColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home
            ),
            title: Text('新闻')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.image
            ),
            title: Text('美图')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie
            ),
            title: Text('视频')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wb_sunny
            ),
            title: Text('天气')
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person
            ),
            title: Text('我的')
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            this._currentIndex = index;
          });
        },
      ),
    );
  }
}