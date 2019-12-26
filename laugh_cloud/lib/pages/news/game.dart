//游戏
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart';
import '../../component/toast.dart';

class GameScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  ScrollController _controller = new ScrollController();
  var _items = new List<String>();
  var _itemsImage = new List<String>();
  var _itemsTime = new List<String>();
  var _itemsTitle = new List<String>();
  var _itemsUrl = new List<String>();
  var _mPage = 0;
  @override
  void initState() {
    super.initState();
    getData();
    //给_controller添加监听
    _controller.addListener((){
      //判断是否滑动到了页面的最底部
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        //如果不是最后一页数据，则生成新的数据添加到list里面
        if(_mPage < 4){
          _retrieveData();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '游戏',
      home: new Scaffold(
        body: new RefreshIndicator(
            onRefresh: _onRefresh,
             child: new ListView.separated(
                controller: _controller,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  //判断是否构建到了最后一条item
                  if(index == _items.length){
                    //判断是不是最后一页
                    if(_mPage < 4){
                      //不是最后一页，返回一个loading窗
                      return new Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0,),
                        ),
                      );
                    }else{
                      //是最后一页，显示我是有底线的
                      return new Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: new Text('--我是有底线的--',style:TextStyle(color: Colors.blue),),
                      );
                    }
                  }else{
                    return Column(children: <Widget>[
                      GestureDetector(child: Image.network('${_itemsImage[index]}'),onTap: () async {
                        var url = _itemsUrl[index];
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw '浏览器打开失败。';
                        }
                      },),
                      ListTile(title:new Text('${_itemsTitle[index]}'),onTap: () async {
                        var url = _itemsUrl[index];
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw '浏览器打开失败。';
                        }
                      },),
                      ListTile(title:new Text('${_items[index]}'),onTap: () async {
                        var url = _itemsUrl[index];
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw '浏览器打开失败。';
                        }
                      },),
                      ListTile(title:new Text('${_itemsTime[index]}'))
                    ],);
                  }
                },
                //分割线构造器
                separatorBuilder: (context,index){
                  return new Divider(color: Colors.blue,);
                },
                //_items.length + 1是为了给最后一行的加载loading留出位置
                itemCount: _items.length + 1
            ),
        ),
      ),
    );
  }

  void getData() async {
    //初始数据源
    var url = 'https://pacaio.match.qq.com/irs/rcd?cid=56&ext=games&token=c786875b8e04da17b24ea5e332745e0f&num=20&expIds=20190106A13PFT%7C20190108A04MLS&page='+_mPage.toString();
    Response response;
    var dio = new Dio();
    response = await dio.get(url);
    for (int i=0;i<response.data['data'].length;i++){
      _items.insert(_items.length, "${response.data['data'][i]['intro']}");
      _itemsImage.insert(_itemsImage.length, "${response.data['data'][i]['bimg']}");
      _itemsTitle.insert(_itemsTitle.length, "${response.data['data'][i]['title']}");
      _itemsTime.insert(_itemsTime.length, "${response.data['data'][i]['publish_time']}");
      _itemsUrl.insert(_itemsUrl.length, "${response.data['data'][i]['url']}");
    }
    setState(() {
      _items;
      _itemsImage;
      _itemsTitle;
      _itemsTime;
      _itemsUrl;
    });
  }

  void _retrieveData() async {
    //上拉加载新的数据
    _mPage++;
    var url = 'https://pacaio.match.qq.com/irs/rcd?cid=56&ext=games&token=c786875b8e04da17b24ea5e332745e0f&num=20&expIds=20190106A13PFT%7C20190108A04MLS&page='+_mPage.toString();
    Response response;
    var dio = new Dio();
    response = await dio.get(url);
    Future.delayed(Duration(seconds: 1)).then((e){
      for (int i=0;i<response.data['data'].length;i++){
        _items.insert(_items.length, "${response.data['data'][i]['intro']}");
        _itemsImage.insert(_itemsImage.length, "${response.data['data'][i]['bimg']}");
        _itemsTitle.insert(_itemsTitle.length, "${response.data['data'][i]['title']}");
        _itemsTime.insert(_itemsTime.length, "${response.data['data'][i]['publish_time']}");
        _itemsUrl.insert(_itemsUrl.length, "${response.data['data'][i]['url']}");
      }
      setState(() {
        _items;
        _itemsImage;
        _itemsTitle;
        _itemsTime;
        _itemsUrl;
      });
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1)).then((e){
      Toast.toast(context,msg: "暂无更多",position: ToastPostion.bottom);
    });
  }

  @override
  void dispose() {
    //移除监听，防止内存泄漏
    _controller.dispose();
    super.dispose();
  }
}